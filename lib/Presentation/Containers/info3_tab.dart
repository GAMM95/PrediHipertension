import 'package:flutter/material.dart';
import 'package:predihipertension/Presentation/Screens/image_screen.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Widget/lista_items.dart';
import 'package:predihipertension/Presentation/Widget/paragraph.dart';
import 'package:predihipertension/Presentation/Widget/subtitle.dart';

class Info3Tab extends StatelessWidget {
  const Info3Tab({super.key});

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
                'Complicaciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Parragraph(
                parrafo:
                    'Entre otras complicaciones, la hipertensión puede producir daños cardiacos graves. El exceso de presión puede endurecer las arterias, con lo que se reducirá el flujo de sangre y oxígeno que llega al corazón. El aumento de la presión y la reducción del flujo sanguíneo pueden causar:',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              ListaItems(
                parrafo: 'Dolor torácico (angina de pecho).',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Infarto de miocardio, que se produce cuando se obstruye el flujo de sangre que llega al corazón y las células del músculo cardiaco mueren debido a la falta de oxígeno. Cuanto mayor sea la duración de la obstrucción, más importantes serán los daños que sufrirá el corazón.',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Insuficiencia cardiaca, que se produce cuando el corazón no puede bombear suficiente sangre y oxígeno a otros órganos vitales.',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Ritmo cardiaco irregular, que puede conllevar la muerte súbita.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'La hipertensión puede también causar la obstrucción o la rotura de las arterias que llevan la sangre y el oxígeno al cerebro, lo que provocaría un accidente cerebrovascular. Asimismo, puede causar daños renales que generen una insuficiencia renal.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Se trata de un proceso rápido e indoloro que también podemos hacer nosotros mismos con un aparato automático, si bien es importante que un profesional valore el riesgo existente y los trastornos asociados.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Subtitle(
                subtitulo: 'Estadíos de la hipertensión',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImageViewer(
                          imagePath: 'assets/images/estadios.png'),
                    ),
                  );
                },
                child: Center(
                  child: InteractiveViewer(
                    maxScale: 5.0,
                    minScale: 1.0,
                    child: Image.asset('assets/images/estadios.png'),
                  ),
                ),
              ),
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
