import '../Models/resultado.dart';

/// Clase que contiene la lógica para obtener los resultados relacionados con la hipertensión.
class ResultLogic {
  /// Obtiene el texto del resultado basado en el valor numérico proporcionado.
  ///
  /// Retorna 'Sin riesgo de hipertensión' si el valor es 0, de lo contrario, retorna 'Riesgo de hipertensión'.
  String getResultado(int resultadoValue) {
    return resultadoValue == 0
        ? 'Bajo riesgo de desarrollar hipertensión arterial'
        : 'Alto riesgo de desarrollar hipertensión arterial';
  }

  /// Obtiene el texto del primer resultado en la lista de resultados.
  ///
  /// Retorna 'No hay resultado' si la lista está vacía.
  /// De lo contrario, devuelve el texto del primer resultado en la lista.
  String getResultText(List<Resultado> resultados) {
    if (resultados.isEmpty) {
      return "No hay resultado";
    } else {
      // Obtener el primer resultado
      Resultado primerResultado = resultados.first;
      return getResultado(primerResultado.resultado);
    }
  }
}


// import 'package:predihipertension/Domain/Models/resultado.dart';

// class ResultLogic {
//   String getResultado(int resultadoValue) {
//     return resultadoValue == 0 ? 'Persona sana' : 'Riesgo de hipertensión';
//   }

//   String getEmoji(int resultadoValue) {
//     return resultadoValue == 0 ? '😊' : '😞';
//   }

//   String getResultText(List<Resultado> resultados) {
//     if (resultados.isEmpty) {
//       return "No hay resultado";
//     } else {
//       // Obtener el primer resultado
//       Resultado primerResultado = resultados.first;
//       String resultadoText = getResultado(primerResultado.resultado);
//       String emoji = getEmoji(primerResultado.resultado);
//       return "$resultadoText $emoji"; // Agrega el emoji al texto del resultado
//     }
//   }
// }
