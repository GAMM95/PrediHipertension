import 'package:flutter/material.dart';

class Parragraph extends StatelessWidget {
  final String parrafo;
  final Color color;

  const Parragraph({
    super.key,
    required this.parrafo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      parrafo,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
