import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';
import '../Widget/lista_items.dart';
import '../Widget/paragraph.dart';
import '../Widget/subtitle.dart';

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
                    'Según la Organización Mundial de la Salud OMS, se habla de hipertensión cuando la presión de la sangre en nuestros vasos sanguíneos es demasiado alta (de 140/90 mmHg o más). Es un problema frecuente que puede ser grave si no se trata.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Center(
                child: InteractiveViewer(
                  child: Image.asset('assets/images/afectados.png'),
                ),
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'El riesgo de hipertensión puede aumentar cuando se es de una edad avanzada, por causas genéticas, sobrepeso u obesidad, falta de actividad física, comer con mucha sal y beber demasiado alcohol.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Subtitle(
                subtitulo: 'Síntomas',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 8.0),
              Parragraph(
                parrafo:
                    'A pesar de que la mayoría de las personas hipertensas no tienen síntomas, se distinguen, porque la presión arterial muy alta puede causar dolor de cabeza, visión borrosa, dolor en el pecho y otros síntomas.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Las personas que tienen la presión arterial muy alta (de 180/120 o más) pueden presentar estos síntomas:',
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
                parrafo: 'Dificultad para respirar',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Náuseas y/o vómitos',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Visión borrosa o cambios en la visión',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Ansiedad',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Confusión',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Pitidos en los oídos',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Hemorragia nasal',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Cambios en el ritmo cardiaco',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Si tiene usted alguno de estos síntomas y la presión arterial muy alta, acuda de inmediato a un profesional de la salud. La única manera de detectar la hipertensión es recurrir a un profesional de la salud para que mida nuestra presión arterial. ',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Se trata de un proceso rápido e indoloro que también podemos hacer nosotros mismos con un aparato automático, si bien es importante que un profesional valore el riesgo existente y los trastornos asociados.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              // Center(
              //   child: InteractiveViewer(
              //     child: Image.asset('assets/images/hipertension_arterial.png'),
              //   ),
              // ),
              const SizedBox(height: 15.0),
              Text(
                'Fuente: \nOrganización Mundial de la Salud (OMS)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: GlobalColors.bgPanelDark2,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 15.0),
            ],
          )
        ],
      ),
    );
  }
}
