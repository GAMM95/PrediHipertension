import 'package:flutter/material.dart';

class AdvertenciaTest {
  static void mostrar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Bloquear clics fuera del diálogo
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Indicaciones',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Este test está diseñado para prever el riesgo de desarrollar hipertensión arterial. Por favor, responde todas las preguntas con sinceridad y cuidado. Cada una de tus respuestas es importante para obtener un resultado que refleje tu situación con precisión.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 15),
                // Boton Calcular IMC
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Entendido'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
