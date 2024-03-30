class Datatest {
  final int edadIngresada;
  final int edadAgrupada;
  final int sexo;
  final double imc;
  final int saludGeneral;
  final int saludFisica;
  final int saludMental;
  final int dificultadCaminar;
  final int consumoFrutas;
  final int consumoVerduras;
  final int consumoCigarros;
  final int consumoAlcohol;
  final int actividadFisica;
  final int colesterol;
  final int chequeoColesterol;
  final int acv;
  final int diabetes;
  final int enfermedadCardiaca;
  // final String resultado;

  Datatest({
    required this.edadIngresada,
    required this.edadAgrupada,
    required this.sexo,
    required this.imc,
    required this.saludGeneral,
    required this.saludFisica,
    required this.saludMental,
    required this.dificultadCaminar,
    required this.consumoFrutas,
    required this.consumoVerduras,
    required this.consumoCigarros,
    required this.consumoAlcohol,
    required this.actividadFisica,
    required this.colesterol,
    required this.chequeoColesterol,
    required this.acv,
    required this.diabetes,
    required this.enfermedadCardiaca,
  });

  factory Datatest.fromMap(Map<String, dynamic> map) {
    return Datatest(
      edadIngresada: map['edadIngresada'] as int,
      edadAgrupada: map['edadAgrupada'] as int,
      sexo: map['genero'] as int,
      imc: map['imc'] as double,
      saludGeneral: map['saludGeneral'] as int,
      saludFisica: map['saludFisica'] as int,
      saludMental: map['saludMental'] as int,
      dificultadCaminar: map['dificultadCaminar'] as int,
      consumoFrutas: map['consumoFrutas'] as int,
      consumoVerduras: map['consumoVerduras'] as int,
      consumoCigarros: map['consumoCigarros'] as int,
      consumoAlcohol: map['consumoAlcohol'] as int,
      actividadFisica: map['actividadFisica'] as int,
      colesterol: map['colesterol'] as int,
      chequeoColesterol: map['chequeoColesterol'] as int,
      acv: map['acv'] as int,
      diabetes: map['diabetes'] as int,
      enfermedadCardiaca: map['enfermedadCardiaca'] as int,
    );
  }
}
