import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MethodsAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Método para obtener el primer nombre del usuario.
  Future<String?> getFirstName() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Verificar si el usuario está registrado en Firestore
        final DocumentSnapshot docSnapshot =
            await _firestore.collection('usuario').doc(user.uid).get();
        if (docSnapshot.exists) {
          // Obtener solo el primer nombre del usuario
          String? firstName = docSnapshot.get('firstName');
          return firstName;
        }
      }
    } catch (error) {
      // Manejar errores
      rethrow;
    }
    return null;
  }

  /// Método para obtener todos los datos del usuario.
  // // Future<Map<String, dynamic>?> getUserData() async {
  // //   try {
  // //     final User? user = _auth.currentUser;
  // //     if (user != null) {
  // //       // Verificar si el usuario está registrado en Firestore
  // //       final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
  // //           await _firestore.collection('usuario').doc(user.uid).get();
  // //       if (docSnapshot.exists) {
  // //         // Obtener todos los datos del usuario del documento Firestore
  // //         return docSnapshot.data();
  // //       }
  // //     }
  // //   } catch (error) {
  // //     // Manejar errores
  // //     rethrow;
  // //   }
  // //   return null;
  // // }
}
