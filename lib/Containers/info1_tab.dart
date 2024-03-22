import 'package:flutter/material.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Utilities/lista_items.dart';
import 'package:predihipertension/Utilities/paragraph.dart';

class Info1Tab extends StatelessWidget {
  const Info1Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 252, 253),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hipertensión Arterial',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Parragraph(
                parrafo:
                    'Según la **Organización Mundial de la Salud OMS**, se habla de hipertensión cuando la presión de la sangre en nuestros vasos sanguíneos es demasiado alta (de 140/90 mmHg o más). Es un problema frecuente que puede ser grave si no se trata.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: InteractiveViewer(
                  child: Image.asset('assets/images/hipertension_arterial.png'),
                ),
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'El riesgo de hipertensión puede aumentar cuando se es de una edad avanzada, por causas genéticas, por sobrepeso u obesidad, por falta de actividad física, por comer con mucha sal y beber demasiado alcohol.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'A pesar de que la mayoría de las personas hipertensas no tienen síntomas, se distinguen, porque la tensión arterial muy alta puede causar dolor de cabeza, visión borrosa, dolor en el pecho y otros síntomas.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Las personas que tienen la tensión arterial muy alta (de 180/120 o más) pueden presentar estos síntomas:',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              ListaItems(
                parrafo: 'Dolor intenso de cabeza',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Dolor en el pecho',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Mareos',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Dificultad para respirar, ahora que pasaria si este item sobrepasa las 2 lineas, como se podria ver?',
                color: GlobalColors.bgDark1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
