/// Clase que representa los datos de una prueba.
class Datatest {
  final int edadIngresada;
  final int edadAgrupada;
  final int sexo;
  final int educacion;
  final double imc;
  final int saludMental;
  final int consumoFrutas;
  final int consumoVerduras;
  final int consumoSal;
  final int consumoCigarros;
  final int consumoAlcohol;
  final int consumoAlcCompulsivo;
  final int actividadFisica;
  final int colesterol;
  final int diabetes;
  final int ataqueCardiaco;

  /// Constructor que inicializa un objeto Datatest con los datos proporcionados.
  Datatest({
    required this.edadIngresada,
    required this.edadAgrupada,
    required this.sexo,
    required this.educacion,
    required this.imc,
    required this.saludMental,
    required this.consumoFrutas,
    required this.consumoVerduras,
    required this.consumoSal,
    required this.consumoCigarros,
    required this.consumoAlcohol,
    required this.consumoAlcCompulsivo,
    required this.actividadFisica,
    required this.colesterol,
    required this.diabetes,
    required this.ataqueCardiaco,
  });

  /// Constructor de fábrica que crea un objeto Datatest a partir de un mapa.
  factory Datatest.fromMap(Map<String, dynamic> map) {
    return Datatest(
      edadIngresada: map['Edad ingresada'] as int,
      edadAgrupada: map['edadAgrupada'] as int,
      sexo: map['genero'] as int,
      imc: map['imc'] as double,
      educacion: map['educacion'] as int,
      saludMental: map['saludMental'] as int,
      consumoFrutas: map['consumoFrutas'] as int,
      consumoVerduras: map['consumoVerduras'] as int,
      consumoSal: map['consumoSal'] as int,
      consumoCigarros: map['consumoCigarros'] as int,
      consumoAlcohol: map['consumoAlcohol'] as int,
      consumoAlcCompulsivo: map['consumoAlcCompulsivo'] as int,
      actividadFisica: map['actividadFisica'] as int,
      colesterol: map['colesterol'] as int,
      diabetes: map['diabetes'] as int,
      ataqueCardiaco: map['ataqueCardiaco'] as int,
    );
  }
}
