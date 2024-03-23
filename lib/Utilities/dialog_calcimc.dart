import 'package:flutter/material.dart';

import 'package:predihipertension/Components/custom_numberfielddark.dart';
import 'package:predihipertension/Screens/image_screen.dart';

class CalculoIMC {
  static void mostrar(
      BuildContext context, TextEditingController imcController) {
    double peso = 0.0;
    double altura = 0.0;
    double imc = 0.0;

    TextEditingController pesoController = TextEditingController();
    TextEditingController alturaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '¿Cuánto es mi IMC?',
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
                  'Aquí puedes calcular tu Índice de Masa Corporal (IMC). Este valor se utiliza para estimar la cantidad de grasa corporal.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 10),

                // TextField Peso
                CustomNumberFieldDark(
                  hintText: 'Ingrese su peso en kg',
                  enabled: true,
                  cifras: 5,
                  label: const Text('Peso (kg)'),
                  validator: 'Ingrese su peso',
                  controller: pesoController,
                  showNextButton: true,
                ),
                const SizedBox(height: 10),
                // TextField Altura
                CustomNumberFieldDark(
                  hintText: 'Ingrese su altura en m',
                  enabled: true,
                  cifras: 4,
                  label: const Text('Altura (m)'),
                  validator: 'Ingrese su altura',
                  controller: alturaController,
                ),
                const SizedBox(height: 10),
                // Boton Calcular IMC
                ElevatedButton(
                  onPressed: () {
                    peso = double.tryParse(pesoController.text) ?? 0.0;
                    altura = double.tryParse(alturaController.text) ?? 0.0;

                    if (peso > 0 && altura > 0) {
                      imc = peso / (altura * altura);
                      imcController.text = imc.toStringAsFixed(2);
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('Calcular'),
                ),

                /// Imagen Talla - Peso - IMC
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImageViewer(
                            imagePath: 'assets/images/imc.png'),
                      ),
                    );
                  },
                  child: Center(
                    child: InteractiveViewer(
                      // maxScale: 5.0,
                      // minScale: 1.0,
                      child: Image.asset('assets/images/imc.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
