import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/datatest.dart';

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

  // Método para guardar los datos del test en Firestore
  Future<void> guardarTest({
    required Datatest datatest,
  }) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Guardar los datos del test en Firestore
        await _firestore.collection('datatest').add({
          'userId': user.uid,
          'edad': datatest.age,
          'genero': datatest.genere,
          'imc': datatest.imc,
          // Agregar más campos si es necesario
          'timestamp': Timestamp.now(), // Para guardar la fecha y hora del test
        });
      }
    } catch (error) {
      // Manejar errores
      rethrow;
    }
  }

  Future<List<DateTime>> getDataTestDates() async {
    List<DateTime> datasetDates = [];

    try {
      // Obtener el usuario actualmente autenticado
      User? user = _auth.currentUser;

      if (user != null) {
        // Consultar los datasets del usuario actual
        QuerySnapshot querySnapshot = await _firestore
            .collection('datatest')
            .where('userId', isEqualTo: user.uid)
            .get();

        // Iterar sobre los documentos y obtener las fechas
        for (var doc in querySnapshot.docs) {
          Timestamp timestamp = doc['timestamp'];
          DateTime date = timestamp.toDate();
          datasetDates.add(date);
        }
      }

      return datasetDates;
    } catch (e) {
      // Manejar errores
      // print('Error al obtener las fechas de los datasets: $e');
      rethrow;
    }
  }

  // Método para obtener los datos del test para una fecha específica
  Future<List<Datatest>> getDataTestByDate(DateTime date) async {
    List<Datatest> dataTestList = [];

    try {
      // Consultar los datos del test para la fecha especificada
      QuerySnapshot querySnapshot = await _firestore
          .collection('datatest')
          .where('timestamp', isGreaterThanOrEqualTo: date)
          .where('timestamp', isLessThan: date.add(const Duration(days: 1)))
          .get();

      // Iterar sobre los documentos y obtener los datos del test
      for (var doc in querySnapshot.docs) {
        int edad = doc['edad'];
        int genero = doc['genero'];
        double imc = doc['imc'];
        // Agrega más campos según sea necesario

        // Crea un objeto Datatest con los datos obtenidos
        Datatest dataTest = Datatest(age: edad, genere: genero, imc: imc);
        dataTestList.add(dataTest);
      }

      return dataTestList;
    } catch (e) {
      // Manejar errores
      // print('Error al obtener los datos del test: $e');
      rethrow;
    }
  }
}
