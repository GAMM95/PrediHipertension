import 'package:flutter/material.dart';

class Info2Tab extends StatelessWidget {
  const Info2Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 247, 204, 218),
      child: const Center(
        child: Text(
          '¿Qué es la Hipertensión?',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
