class Usuario {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  Usuario({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
