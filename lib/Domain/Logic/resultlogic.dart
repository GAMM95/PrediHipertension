import 'package:predihipertension/Domain/Models/resultado.dart';

class ResultLogic {
  String getResultado(int resultadoValue) {
    return resultadoValue == 0
        ? 'Sin riesgo de hipertensión'
        : 'Riesgo de hipertensión';
  }

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
