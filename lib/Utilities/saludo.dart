class Saludo {
  static String saludarUsuario() {
    final hora = DateTime.now().hour;

    if (hora < 12) {
      return 'Buenos días';
    } else if (hora < 18) {
      return 'Buenas tardes';
    } else {
      return 'Buenas noches';
    }
  }
}
