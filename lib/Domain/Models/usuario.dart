/// Clase que representa un usuario con su información básica.
class Usuario {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  /// Constructor que inicializa un objeto Usuario con los datos proporcionados.
  Usuario({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  /// Constructor de fábrica que crea un objeto Usuario a partir de un mapa.
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }

  /// Convierte el objeto Usuario en un mapa.
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
