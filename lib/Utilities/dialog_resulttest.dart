import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultadoDialog {
  static void mostrar(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[50],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/loader.json',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Este es tu resultado',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ),
          ],
        );
      },
    );
  }
}
