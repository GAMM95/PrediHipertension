class Datatest {
  final int age;
  final int genere;
  final double imc;
  // final Usuario usuario;

  Datatest({
    required this.age,
    required this.genere,
    // required this.usuario,
    required this.imc,
  });

  factory Datatest.fromMap(Map<String, dynamic> map) {
    return Datatest(
      age: map['age'] as int,
      genere: map['genere'] as int,
      imc: map['imc'] as double,
      // usuario: Usuario.fromMap(map['usuario'] as Map<String, dynamic>),
    );
  }
}
