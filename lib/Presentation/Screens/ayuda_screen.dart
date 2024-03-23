import 'package:flutter/material.dart';

import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Widget/lista_items.dart';
import 'package:predihipertension/Presentation/Widget/paragraph.dart';
import 'package:predihipertension/Presentation/Widget/subtitle.dart';

class AyudaScreen extends StatefulWidget {
  const AyudaScreen({super.key});

  @override
  State<AyudaScreen> createState() => _TerminosCondicionesScreenState();
}

class _TerminosCondicionesScreenState extends State<AyudaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgDark1,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(30.0),
            decoration: const BoxDecoration(
              // color: GlobalColors.bgPanelDark,
              color: Color.fromARGB(255, 255, 252, 253),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 50.0),
                    Text(
                      "TÉRMINOS Y CONDICIONES DE USO DEL APLICATIVO MÓVIL PREDIHIPERTENSION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: GlobalColors.titlePrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Parragraph(
                      parrafo:
                          'Por favor, lee detenidamente estos términos y condiciones antes de utilizar nuestra aplicación de predicción de hipertensión. Al acceder o utilizar esta aplicación, aceptas estar legalmente vinculado por estos términos y condiciones.',
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Subtitle(
                      subtitulo: "Descripción de la Aplicación",
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Parragraph(
                      parrafo:
                          "Nuestra aplicación móvil tiene como objetivo proporcionar información y predicciones relacionadas con la hipertensión. Ofrece funcionalidades como:",
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    ListaItems(
                      parrafo:
                          'Análisis de datos introducidos por el usuario para predecir riesgos de hipertensión.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Proporciona recomendaciones generales relacionadas con la salud cardiovascular.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Almacena datos de usuario de manera segura y confidencial.',
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Subtitle(
                      subtitulo: "Requisitos de Uso",
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Parragraph(
                      parrafo:
                          'Al utilizar esta aplicación, aceptas y confirmas que:',
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Subtitle(
                      subtitulo: "Protección de Datos y Privacidad",
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    Parragraph(
                      parrafo:
                          'La seguridad y privacidad de tus datos son fundamentales para nosotros. La información que compartas con la aplicación se manejará de acuerdo con nuestra [Política de Privacidad](enlace a la política de privacidad). Nos comprometemos a proteger tus datos y a no compartir información personal sin tu consentimiento.',
                      color: GlobalColors.bgDark1,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Regresa al frame anterior
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
