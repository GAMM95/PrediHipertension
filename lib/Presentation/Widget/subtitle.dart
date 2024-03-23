import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String subtitulo;
  final Color color;
  const Subtitle({
    super.key,
    required this.subtitulo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitulo,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
