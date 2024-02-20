import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';
import '../Utilities/parragraph.dart';
import '../Utilities/subtitle.dart';

class TerminosCondicionesScreen extends StatefulWidget {
  const TerminosCondicionesScreen({super.key});

  @override
  State<TerminosCondicionesScreen> createState() =>
      _TerminosCondicionesScreenState();
}

class _TerminosCondicionesScreenState extends State<TerminosCondicionesScreen> {
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
            decoration: BoxDecoration(
              color: GlobalColors.bgPanelDark,
              borderRadius: const BorderRadius.all(
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
                        color: GlobalColors.titlePanel,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Parragraph(
                        parrafo:
                            'Por favor, lee detenidamente estos términos y condiciones antes de utilizar nuestra aplicación de predicción de hipertensión. Al acceder o utilizar esta aplicación, aceptas estar legalmente vinculado por estos términos y condiciones.'),
                    const SizedBox(height: 10.0),
                    const Subtitle(subtitulo: "Descripción de la Aplicación"),
                    const SizedBox(height: 10.0),
                    const Parragraph(
                        parrafo:
                            "Nuestra aplicación móvil tiene como objetivo proporcionar información y predicciones relacionadas con la hipertensión. Ofrece funcionalidades como:"),
                    const SizedBox(height: 10.0),
                    const Parragraph(
                        parrafo:
                            "- Análisis de datos introducidos por el usuario para predecir riesgos de hipertensión.\n- Proporciona recomendaciones generales relacionadas con la salud cardiovascular.\n♥ Almacena datos de usuario de manera segura y confidencial."),
                    const SizedBox(height: 10.0),
                    const Subtitle(subtitulo: "Requisitos de Uso"),
                    const SizedBox(height: 10.0),
                    const Parragraph(
                        parrafo:
                            'Al utilizar esta aplicación, aceptas y confirmas que:'),
                    const SizedBox(height: 10.0),
                    const Subtitle(
                        subtitulo: "Protección de Datos y Privacidad"),
                    const SizedBox(height: 10.0),
                    const Parragraph(
                        parrafo:
                            'La seguridad y privacidad de tus datos son fundamentales para nosotros. La información que compartas con la aplicación se manejará de acuerdo con nuestra [Política de Privacidad](enlace a la política de privacidad). Nos comprometemos a proteger tus datos y a no compartir información personal sin tu consentimiento.'),
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
