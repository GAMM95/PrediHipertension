import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';
import '../Widget/paragraph.dart';
import '../Widget/subtitle.dart';

class DataAuthScreen extends StatefulWidget {
  const DataAuthScreen({super.key});

  @override
  State<DataAuthScreen> createState() => _DataAuthScreenState();
}

class _DataAuthScreenState extends State<DataAuthScreen> {
  @override
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
                      "AUTORIZACIÓN PARA EL TRATAMIENTO DE DATOS PERSONALES",
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
                          'Yo, en mi calidad de usuario de la aplicación móvil PrediHipertensión, otorgo mi consentimiento libre, previo, expreso e informado de conformidad con la Ley N° 29733, Ley de Protección de Datos Personales y su Reglamento, para que mis datos personales, incluyendo aquellos relacionados con mi salud y datos sensibles, como el registro de usuario e información complementaria, que se encuentran en el historial de la base de datos Firestore de Firebase, sean accedidos y tratados por el equipo de PrediHipertension con el propósito específico de crear un nuevo dataset.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: 'Consentimiento del Paciente',
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'He sido debidamente informado del propósito y la naturaleza del tratamiento de mis datos personales descrito anteriormente, así como de las alternativas disponibles, los posibles riesgos y los resultados esperados. Por lo tanto, doy mi consentimiento de manera libre y voluntaria al procedimiento propuesto.',
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
