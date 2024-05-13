import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:predihipertension/Domain/Models/datatest.dart';
import 'package:predihipertension/Domain/Models/resultado.dart';

/// Clase que proporciona métodos para la autenticación y la gestión de datos del usuario.
class MethodsAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Devuelve el usuario actualmente autenticado.
  User? get currentUser => _auth.currentUser;

  /// Stream que emite cambios en el estado de la autenticación.
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

  /// Metodo para guardar Test de Hipertension Arterial
  Future<void> guardarTest({
    required Datatest datatest,
  }) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Obtener una referencia al documento del usuario
        final userDocRef = _firestore.collection('usuario').doc(user.uid);

        // Crear una subcolección 'datatest' dentro del documento del usuario
        final userDatatestCollectionRef = userDocRef.collection('datatest');

        // Generar un ID único para el nuevo documento
        final newDocRef = userDatatestCollectionRef.doc();

        // Guardar los datos del test dentro de la subcolección 'datatest'
        await newDocRef.set({
          'id': newDocRef.id, // Agregar el ID único al documento
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

  /// Metodo para guardar el resultado de la evaluacion del test de Hipertension 
  Future<void> guardarResultadoPrediccion({
    required Resultado resultado,
  }) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final userDocRef = _firestore.collection('usuario').doc(user.uid);
        final userDatatestCollectionRef = userDocRef.collection('datatest');

        // Obtener una referencia al último documento de datatest ordenado por fecha
        final QuerySnapshot datatestSnapshot = await userDatatestCollectionRef
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get();
        final lastDatatestDocRef = datatestSnapshot.docs.isNotEmpty
            ? datatestSnapshot.docs.first.reference
            : null;

        if (lastDatatestDocRef != null) {
          // Crear una subcolección 'resultado' dentro del último documento de datatest
          final userResultCollectionRef =
              lastDatatestDocRef.collection('resultado');
          await userResultCollectionRef.add({
            'timestamp': Timestamp.now(),
            'resultadoPrediccion': resultado.resultado,
          });
        }
      }
    } catch (error) {
      rethrow; // Manejo de errores
    }
  }

  /// Método para obtener las fechas de los tests realizados por el usuario.
  Future<List<DateTime>> getDataTestDates() async {
    List<DateTime> datasetDates = [];
    try {
      // Obtener el usuario actualmente autenticado
      User? user = _auth.currentUser;

      if (user != null) {
        // Obtener una referencia a la subcolección 'datatest' dentro del documento del usuario
        final userDatatestCollectionRef = _firestore
            .collection('usuario')
            .doc(user.uid)
            .collection('datatest');

        // Consultar los documentos en la subcolección 'datatest'
        QuerySnapshot querySnapshot = await userDatatestCollectionRef.get();

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

  /// Método para obtener los datos del test para una fecha específica.
  Future<List<Datatest>> getDataTestByDate(DateTime date) async {
    List<Datatest> dataTestList = [];
    try {
      // Obtener el usuario actualmente autenticado
      User? user = _auth.currentUser;

      if (user != null) {
        // Obtener una referencia a la subcolección 'datatest' dentro del documento del usuario
        final userDatatestCollectionRef = _firestore
            .collection('usuario')
            .doc(user.uid)
            .collection('datatest');

        // Consultar los documentos en la subcolección 'datatest' para la fecha especificada
        QuerySnapshot querySnapshot = await userDatatestCollectionRef
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

          // Crear un objeto Datatest con los datos obtenidos
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
      }
      return dataTestList;
    } catch (e) {
      rethrow;
    }
  }

  /// Método para eliminar un test basado en la fecha.
  Future<void> deleteTestByDateTime(DateTime dateTime) async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        // Obtener una referencia a la subcolección 'datatest' dentro del documento del usuario
        final userDatatestCollectionRef = _firestore
            .collection('usuario')
            .doc(user.uid)
            .collection('datatest');

        // Consultar los documentos en la subcolección 'datatest'
        QuerySnapshot querySnapshot = await userDatatestCollectionRef.get();

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

  /// Metodo para obtener los resultados de los test de hipertension 
  Future<List<Resultado>> getResultadoPorTest(DateTime date) async {
    List<Resultado> resultList = [];
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        final userDatatestCollectionRef = _firestore
            .collection('usuario')
            .doc(user.uid)
            .collection('datatest');

        QuerySnapshot querySnapshot = await userDatatestCollectionRef
            .where('timestamp', isGreaterThanOrEqualTo: date)
            .where('timestamp', isLessThan: date.add(const Duration(days: 1)))
            .get();

        for (var doc in querySnapshot.docs) {
          // Obtener la referencia a la subcolección 'resultado' dentro del datatest
          final resultadoCollectionRef = doc.reference.collection('resultado');

          // Consultar los documentos en la subcolección 'resultado'
          QuerySnapshot resultadoSnapshot = await resultadoCollectionRef.get();

          // Iterar sobre los documentos y obtener el primer resultado
          for (var resultadoDoc in resultadoSnapshot.docs) {
            var data = resultadoDoc.data();
            if (data != null && data is Map<String, dynamic>) {
              // Utilizar el constructor fromMap para crear un objeto Resultado
              Resultado resultado = Resultado.fromMap(data);
              resultList.add(resultado);
            }
          }
        }
      }
      return resultList; 
    } catch (e) {
      rethrow;
    }
  }
}
