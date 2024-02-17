import 'package:flutter/material.dart';

class Info1Tab extends StatelessWidget {
  const Info1Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 247, 204, 218),
      child: const Center(
        child: Text(
          'Datos y Cifras',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
