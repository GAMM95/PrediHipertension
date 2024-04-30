import 'package:flutter/material.dart';

/// Widget reutilizable para un botón de bienvenida personalizado.
class WelcomeButton extends StatelessWidget {
  /// Constructor para crear un botón de bienvenida.
  const WelcomeButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  /// Texto que se mostrará en el botón.
  final String buttonText;

  /// Función de devolución de llamada que se ejecutará cuando se presione el botón.
  final VoidCallback onTap;

  /// Color de fondo del botón.
  final Color color;

  /// Color del texto del botón.
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        // height: 150.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}