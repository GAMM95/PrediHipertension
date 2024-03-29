class Resultado {
  final int resultado;

  Resultado({
    required this.resultado,
  });

  factory Resultado.fromMap(Map<String, dynamic> map) {
    return Resultado(
      resultado: map['resultadoPrediccion'] as int,
    );
  }
}
