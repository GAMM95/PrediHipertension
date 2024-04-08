// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:predihipertension/Core/Services/firebase_auth.dart';
import 'package:predihipertension/Core/Services/methods_firebase.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Domain/Models/resultado.dart';

class CustomDialogs {
  static void showErrorDialog(
      BuildContext context, String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          backgroundColor: Colors.red[50],
          icon: Lottie.asset(
            'assets/animations/alert.json',
            width: 80,
            height: 80,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: GlobalColors.titleColor,
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: GlobalColors.titleColor,
            ),
          ),
        );
      },
    );
  }

  static void showCorrectDialog(
      BuildContext context, String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          backgroundColor: Colors.red[50],
          icon: Lottie.asset(
            'assets/animations/dialog.json',
            width: 80,
            height: 80,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: GlobalColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: GlobalColors.titleColor,
            ),
          ),
        );
      },
    );
  }

  static void despedidaDialog(
      BuildContext context, String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.of(context)
              .pop(true); // Cierra el diálogo después de 3 segundos
        });
        return AlertDialog(
          backgroundColor: Colors.red[50],
          icon: Lottie.asset(
            'assets/animations/brokenheart.json',
            width: 100,
            height: 100,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: GlobalColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: GlobalColors.titleColor,
            ),
          ),
        );
      },
    );
  }

  static void cerrarSesion(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          icon: Lottie.asset(
            'assets/animations/logout.json',
            width: 100,
            height: 100,
          ),
          content: Text(
            '¿Seguro que quieres salir?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: GlobalColors.titleColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await AuthService().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/welcome', (route) => false);
              },
              child: const Text(
                'Sí',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.titleColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void eliminarCuenta(
      BuildContext context, String title, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red[50],
          icon: Lottie.asset(
            'assets/animations/brokenheart.json',
            width: 100,
            height: 100,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: GlobalColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: GlobalColors.titleColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Espera a que se cierre el diálogo de despedida antes de navegar a la página de bienvenida
                Future.delayed(const Duration(milliseconds: 1500), () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/welcome', (route) => false);
                });
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: GlobalColors.titleColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void mostrarResultadoTest(BuildContext context, String resultado) {
    // Parsear el JSON
    final Map<String, dynamic> parsedResult = jsonDecode(resultado);

    // Extraer el valor de hipertensión y convertirlo a entero
    final dynamic hypertensionValue = parsedResult['hypertension'];
    final int hypertension = hypertensionValue is String
        ? int.tryParse(hypertensionValue) ?? 0
        : hypertensionValue ?? 0;

    // Definir el mensaje según el valor de la hipertensión
    String message;
    if (hypertension == 0) {
      message =
          '¡Felicidades! Usted no esta propenso a desarrollar hipertensión arterial.';
    } else if (hypertension == 1) {
      message =
          '¡A tomar precauciones! Usted es un paciente propenso a desarrollar hipertensión arterial.';
    } else {
      message = 'No se pudo determinar el resultado.';
    }

    // Llamar al método para guardar el resultado
    MethodsAuth().guardarResultadoPrediccion(
        resultado: Resultado(resultado: hypertension));

    // Mostrar el diálogo con el mensaje personalizado
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
                    'assets/animations/heart_test.json',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Resultado:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
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
