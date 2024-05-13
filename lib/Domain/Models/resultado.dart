/// Clase que representa el resultado de una predicción.
class Resultado {
  final int resultado;

  /// Constructor que inicializa un objeto Resultado con el valor proporcionado.
  Resultado({
    required this.resultado,
  });

  /// Constructor de fábrica que crea un objeto Resultado a partir de un mapa.
  factory Resultado.fromMap(Map<String, dynamic> map) {
    return Resultado(
      resultado: map['resultadoPrediccion'] as int,
    );
  }
}