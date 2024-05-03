import 'package:flutter/material.dart';

/// Widget reutilizable para mostrar un subtítulo.
class Subtitle extends StatelessWidget {
  /// El texto del subtítulo que se mostrará.
  final String subtitulo;

  /// El color del texto del subtítulo.
  final Color color;

  /// Constructor para crear un subtítulo.
  const Subtitle({
    super.key,
    required this.subtitulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitulo,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: color,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
