// import 'dart:convert' show json;
// import 'package:flutter/services.dart' show rootBundle;

// class ModeloPrediccion {
//   late Map<String, dynamic> _modeloParams;

//   ModeloPrediccion() {
//     _modeloParams = {};
//   }

//   Future<void> cargarModeloParams() async {
//     try {
//       String jsonString = await rootBundle.loadString('assets/modelo_params.json');
//       _modeloParams = json.decode(jsonString);
//     } catch (e) {
//       print('Error al cargar los parámetros del modelo: $e');
//     }
//   }

//   // Obtener el número de estimadores del modelo
//   int? get n_estimators => _modeloParams['n_estimators'];

//   // Obtener la profundidad máxima del árbol
//   int? get max_depth => _modeloParams['max_depth'];

//   // Agregar más getters según los parámetros de tu modelo

//   // Ejemplo de cómo se usaría en otra parte de tu código
//   void ejemploDeUso() async {
//     await cargarModeloParams();
//     if (n_estimators != null && max_depth != null) {
//       print('Número de estimadores: $n_estimators');
//       print('Profundidad máxima: $max_depth');
//     } else {
//       print('No se pudieron cargar los parámetros del modelo.');
//     }
//   }
// }
