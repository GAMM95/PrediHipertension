import 'usuario.dart';

class Datatest {
  final int age;
  final int genere;
  final Usuario usuario;

  Datatest({
    required this.age,
    required this.genere,
    required this.usuario,
  });

  factory Datatest.fromMap(Map<String, dynamic> map) {
    return Datatest(
      age: map['age'] as int,
      genere: map['genere'] as int,
      usuario: Usuario.fromMap(map['usuario'] as Map<String, dynamic>),
    );
  }
}
