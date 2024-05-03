import 'package:flutter/material.dart';

/// Widget reutilizable para mostrar un párrafo de texto justificado.
class Parragraph extends StatelessWidget {
  /// El texto del párrafo que se mostrará.
  final String parrafo;

  /// El color del texto del párrafo.
  final Color color;

  /// Constructor para crear un párrafo de texto.
  const Parragraph({
    super.key,
    required this.parrafo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          parrafo,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: color,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
