import 'package:flutter/material.dart';
import 'package:predihipertension/Presentation/Screens/image_screen.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Widget/lista_items.dart';
import 'package:predihipertension/Presentation/Widget/paragraph.dart';

class Info2Tab extends StatelessWidget {
  const Info2Tab({super.key});

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
                'Recomendaciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Parragraph(
                parrafo:
                    'Hay cambios de hábitos que ayudan a reducir la presión arterial alta (PA), entre ellos:',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImageViewer(
                          imagePath: 'assets/images/tratamiento.png'),
                    ),
                  );
                },
                child: Center(
                  child: InteractiveViewer(
                    maxScale: 5.0,
                    minScale: 1.0,
                    child: Image.asset('assets/images/tratamiento.png'),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Si tiene usted la presión alta, es posible que el médico le recomiende tomar uno o varios medicamentos para rebajarla hasta un nivel que dependerá de las otras enfermedades que padezca.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Deberá reducir la presión hasta menos de 130/80 si tiene también:',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Una enfermedad cardiovascular (del corazón o un derrame cerebral).',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Diabetes (un exceso de azúcar en la sangre).',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Insuficiencia renal crónica.',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo:
                    'Riesgo elevado de sufrir enfermedades cardiovasculares.',
                color: GlobalColors.bgDark1,
              ),
              ListaItems(
                parrafo: 'Alto nivel de estrés.',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Prevención',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Parragraph(
                parrafo:
                    'Hay cambios de hábitos que pueden ayudar a las personas con hipertensión a reducir su tensión arterial, aunque en algunos casos es necesario tomar medicamentos recetados por un médico y seguir con regularidad las visitas previstas con su profesional de la salud. Estos cambios pueden prevenir y reducir la tensión arterial elevada:',
                color: GlobalColors.bgDark1,
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ImageViewer(
                          imagePath: 'assets/images/decalogo.png'),
                    ),
                  );
                },
                child: Center(
                  child: InteractiveViewer(
                    // maxScale: 5.0,
                    // minScale: 1.0,
                    child: Image.asset('assets/images/decalogo.png'),
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
