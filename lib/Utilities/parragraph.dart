import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';

class Parragraph extends StatelessWidget {
  final String parrafo;
  const Parragraph({super.key, required this.parrafo});

  @override
  Widget build(BuildContext context) {
    return Text(
      parrafo,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: GlobalColors.textColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
