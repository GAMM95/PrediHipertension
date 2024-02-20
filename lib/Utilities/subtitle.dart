import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';

class Subtitle extends StatelessWidget {
  final String subtitulo;
  const Subtitle({super.key, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitulo,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: GlobalColors.textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
