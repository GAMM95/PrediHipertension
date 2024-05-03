import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:predihipertension/Domain/Models/usuario.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Método para registrar un usuario con autenticación de email y contraseña.
  Future<bool> signUp({
    required Usuario usuario,
  }) async {
    try {
      // Verificar si el correo electrónico ya está registrado.
      await _auth.createUserWithEmailAndPassword(
        email: usuario.email.trim(),
        password: usuario.password.trim(),
      );

      // Obtener el ID del usuario autenticado
      String userId = _auth.currentUser!.uid;

      // Guardar información adicional del usuario en Firestore
      await _firestore.collection('usuario').doc(userId).set({
        'firstName': usuario.firstName,
        'lastName': usuario.lastName,
        'email': usuario.email,
        'password': usuario.password,
      });

      // Enviar correo de verificación
      await _auth.currentUser!.sendEmailVerification();

      return true; // Registro exitoso
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return false; // Correo electrónico ya registrado
      } else {
        throw 'Error durante el registro: ${e.message}';
      }
    } catch (error) {
      rethrow; // Reenviar la excepción para que pueda ser manejada en la capa superior.
    }
  }

  /// Método para iniciar sesión con autenticación de email y contraseña.
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // Verificar si el correo electrónico está verificado
      if (!_auth.currentUser!.emailVerified) {
        throw 'Por favor, revise su bandeja de entrada de su correo electrónico registrado antes de continuar.';
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Usted no está registrado.';
      } else if (e.code == 'wrong-password') {
        throw 'Contraseña incorrecta.';
      } else if (e.code == 'invalid-email') {
        throw 'Correo electrónico no válido.';
      } else {
        throw "Error durante la autenticación: Correo electrónico no registrado o credenciales incorrectas";
      }
    } catch (error) {
      // Reenviar la excepción para que pueda ser manejada en la capa superior.
      rethrow;
    }
  }

  /// Método para iniciar sesión con Google.
  Future<User?> signInWithGoogle() async {
    try {
      // Iniciar sesión con Google
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Autenticar con Firebase
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Obtener el usuario autenticado
        final User? user = userCredential.user;

        // Verificar si el usuario está registrado en Firestore
        final DocumentSnapshot docSnapshot =
            await _firestore.collection('usuario').doc(user!.uid).get();
        if (!docSnapshot.exists) {
          // El usuario no está registrado en Firestore, guardar datos adicionales
          await _firestore.collection('usuario').doc(user.uid).set({
            'firstName':
                user.displayName != null ? user.displayName!.split(' ')[0] : '',
            'lastName': user.displayName != null
                ? user.displayName!.split(' ').skip(1).join(' ')
                : '',
            'email': user.email,
            'password': '',
          });
        }
        // Retornar el usuario autenticado
        return user;
      }
    } catch (error) {
      // Manejar errores
      rethrow;
    }
    return null;
  }

  /// Método para restablecer la contraseña de un usuario.
  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Usuario no encontrado. Regístrese antes de restablecer la contraseña.';
      } else if (e.code == 'invalid-email') {
        throw 'Correo electrónico no válido.';
      } else {
        throw 'Ocurrió un problema: ${e.message}';
      }
    } catch (error) {
      // Reenviar la excepción para que pueda ser manejada en la capa superior.
      throw 'Error inesperado durante el restablecimiento de la contraseña.';
    }
  }

  /// Método para cerrar sesión.
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw 'Error al cerrar sesión: $e';
    }
  }

  Future<void> deleteAccount() async {
    try {
      // Obtener el usuario actualmente autenticado
      User? user = _auth.currentUser;

      if (user != null) {
        // Eliminar los datos del usuario en Firestore
        await _firestore.collection('usuario').doc(user.uid).delete();

        // Eliminar la cuenta del usuario en Firebase Authentication
        await user.delete();
      } else {
        // Si no hay usuario autenticado, eliminar la colección datatest
        await _firestore.collection('datatest').get().then((querySnapshot) {
          // ignore: avoid_function_literals_in_foreach_calls
          querySnapshot.docs.forEach((doc) async {
            await doc.reference.delete();
          });
        });
      }

      // Desconectar al usuario localmente
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      // Manejar errores
      if (e is FirebaseAuthException) {
        // Error relacionado con Firebase Authentication
        throw 'Error al eliminar la cuenta: ${e.message}';
      } else if (e is FirebaseException) {
        // Error relacionado con Firestore
        throw 'Error al eliminar los datos del usuario: ${e.message}';
      } else {
        // Otros errores
        throw 'Error inesperado al eliminar la cuenta: $e';
      }
    }
  }

  static Future<String> getDisplayNameFromFirestore() async {
    // Obtener el ID del usuario autenticado
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Obtener los datos del usuario desde Firestore
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('usuario')
        .doc(userId)
        .get();

    if (docSnapshot.exists) {
      // Convertir los datos a un mapa para acceder a las propiedades de manera segura
      Map<String, dynamic> userData =
          docSnapshot.data() as Map<String, dynamic>;

      // Obtener el nombre y el apellido del usuario del mapa
      String? firstName = userData['firstName'];
      String? lastName = userData['lastName'];

      // Concatenar el nombre y el apellido si ambos existen
      String fullName = '';
      if (firstName != null) {
        fullName += firstName;
      }
      if (lastName != null) {
        fullName += ' $lastName';
      }

      return fullName;
    } else {
      return ''; // Retorna una cadena vacía si no se encuentra el documento
    }
  }
}
