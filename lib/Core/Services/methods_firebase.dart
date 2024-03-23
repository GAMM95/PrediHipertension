import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:predihipertension/Domain/Entities/datatest.dart';

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
          'edadIngresada': datatest.edadIngresada,
          'edadAgrupada': datatest.edadAgrupada,
          'genero': datatest.sexo,
          'imc': datatest.imc,
          'saludGeneral': datatest.saludGeneral,
          'saludFisica': datatest.saludFisica,
          'saludMental': datatest.saludMental,
          'dificultadCaminar': datatest.dificultadCaminar,
          'consumoFrutas': datatest.consumoFrutas,
          'consumoVerduras': datatest.consumoVerduras,
          'consumoCigarros': datatest.consumoCigarros,
          'consumoAlcohol': datatest.consumoAlcohol,
          'actividadFisica': datatest.actividadFisica,
          'colesterol': datatest.colesterol,
          'chequeoColesterol': datatest.chequeoColesterol,
          'acv': datatest.acv,
          'diabetes': datatest.diabetes,
          'enfermedadCardiaca': datatest.enfermedadCardiaca,
          'timestamp': Timestamp.now(),
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

        // Ordenar las fechas en orden descendente
        datasetDates.sort((a, b) => b.compareTo(a));
      }

      return datasetDates;
    } catch (e) {
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
        int edadingresada = doc['edadIngresada'];
        int edadAgrupada = doc['edadAgrupada'];
        int genero = doc['genero'];
        double imc = doc['imc'];
        int saludGeneral = doc['saludGeneral'];
        int saludFisica = doc['saludFisica'];
        int saludMental = doc['saludMental'];
        int dificultadCaminar = doc['dificultadCaminar'];
        int consumoFrutas = doc['consumoFrutas'];
        int consumoVerduras = doc['consumoVerduras'];
        int consumoCigarros = doc['consumoCigarros'];
        int consumoAlcohol = doc['consumoAlcohol'];
        int actividadFisica = doc['actividadFisica'];
        int colesterol = doc['colesterol'];
        int chequeoColesterol = doc['chequeoColesterol'];
        int acv = doc['acv'];
        int diabetes = doc['diabetes'];
        int enfermedadCardiaca = doc['enfermedadCardiaca'];

        // Crea un objeto Datatest con los datos obtenidos
        Datatest dataTest = Datatest(
          edadIngresada: edadingresada,
          edadAgrupada: edadAgrupada,
          sexo: genero,
          imc: imc,
          saludGeneral: saludGeneral,
          saludFisica: saludFisica,
          saludMental: saludMental,
          dificultadCaminar: dificultadCaminar,
          consumoFrutas: consumoFrutas,
          consumoVerduras: consumoVerduras,
          consumoCigarros: consumoCigarros,
          consumoAlcohol: consumoAlcohol,
          actividadFisica: actividadFisica,
          colesterol: colesterol,
          chequeoColesterol: chequeoColesterol,
          acv: acv,
          diabetes: diabetes,
          enfermedadCardiaca: enfermedadCardiaca,
        );
        dataTestList.add(dataTest);
      }

      return dataTestList;
    } catch (e) {
      rethrow;
    }
  }

  // Método para eliminar un test basado en la fecha
  Future<void> deleteTestByDateTime(DateTime dateTime) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('datatest')
            .where('userId', isEqualTo: user.uid)
            .get();

        // Iterar sobre los documentos y eliminar aquellos que coincidan con la fecha y hora
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((doc) async {
          Timestamp timestamp = doc['timestamp'];
          DateTime documentDateTime = timestamp.toDate();
          if (documentDateTime.isAtSameMomentAs(dateTime)) {
            await doc.reference.delete();
          }
        });
      }
    } catch (error) {
      rethrow;
    }
  }
}
