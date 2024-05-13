/// Clase estática para generar un saludo basado en la hora actual.
class Saludo {
  /// Método estático que devuelve un saludo basado en la hora actual del día.
  /// Retorna 'Buenos días' si es antes de las 12 PM,
  /// 'Buenas tardes' si es antes de las 6 PM, y
  /// 'Buenas noches' en cualquier otro momento.
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
