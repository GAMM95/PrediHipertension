class ComposicionCorporal {
  static String obtenerComposicion(double imc) {
    if (imc < 18.5) {
      return 'Peso inferior al normal';
    } else if (imc >= 18.5 && imc <= 24.9) {
      return 'Peso normal';
    } else if (imc >= 25.0 && imc <= 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30.0 && imc <= 39.9) {
      return 'Obesidad';
    } else {
      return 'Obesidad extrema';
    }
  }
}
