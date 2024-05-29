import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';
import '../Widget/lista_items.dart';
import '../Widget/paragraph.dart';
import '../Widget/subtitle.dart';

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
                          'Por favor, lee atentamente estos términos y condiciones antes de utilizar la aplicación PrediHipertension. Al acceder o utilizar esta aplicación, aceptas los términos y condiciones descritos a continuación.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: '1. Descripción de la Aplicación:',
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'La aplicación PrediHipertensión utiliza un avanzado modelo de Machine Learning entrenado específicamente para predecir el riesgo de desarrollar hipertensión arterial. Este modelo toma en consideración 17 factores de riesgo reconocidos por su potencial asociación con la hipertensión arterial. El usuario es consciente de que va a realizar un test diseñado para evaluar diversos aspectos de su vida, incluyendo información personal, salud física y mental, así como hábitos y estilos de vida.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "2. Finalidad de la Aplicación:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'PrediHipertensión tiene como objetivo principal predecir, educar y motivar a los usuarios para que adopten un estilo de vida saludable a largo plazo, con el fin de reducir el riesgo de hipertensión arterial.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "3. Test de Evaluación:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'El test de evaluación consiste en 17 preguntas relacionadas con información personal, salud física y mental, y hábitos y estilos de vida. Es crucial que el usuario responda con honestidad y precisión para obtener resultados precisos. Se debe tener en cuenta el tiempo necesario para realizar y procesar el test de predicción.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: '4. Requisitos del Usuario:',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'El usuario debe estar conectado a internet para utilizar la aplicación.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Edad mínima de 18 años para el uso de la aplicación, dado que el modelo de datos está diseñado para personas adultas.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Capacidad cognitiva suficiente para comprender y responder correctamente las preguntas del test de evaluación.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Se recomienda a los usuarios que consulten a un profesional de la salud si tienen alguna preocupación específica sobre su salud.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "5. Propiedad Intelectual:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'Todo el contenido de la aplicación PrediHipertensión, incluyendo textos, gráficos, logotipos, iconos, imágenes y cualquier otro material, está protegido por derechos de propiedad intelectual y es propiedad exclusiva de PrediHipertensión. Se otorga una licencia para copiar el contenido de la aplicación únicamente para uso personal del usuario.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "6. Obligaciones del Usuario:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'Al utilizar la aplicación PrediHipertensión, el usuario se compromete a:',
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 10.0),
                    ListaItems(
                      parrafo:
                          'Utilizar la aplicación de manera responsable y para los fines previstos.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Proporcionar información precisa y veraz durante el test de evaluación.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'Respetar los derechos de propiedad intelectual de la aplicación y no copiar, distribuir ni modificar su contenido sin autorización previa de PrediHipertensión.',
                      color: GlobalColors.bgDark1,
                    ),
                    ListaItems(
                      parrafo:
                          'No utilizar la aplicación de manera que pueda dañar, sobrecargar o afectar negativamente su funcionamiento.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "7. Limitación de Responsabilidad:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'PrediHipertensión proporciona información y herramientas para promover un estilo de vida saludable, pero no reemplaza el consejo médico profesional. PrediHipertension no se hace responsable de ningún daño directo, indirecto, incidental, especial o consecuente que pueda surgir del uso de la aplicación.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo:
                          "8. Modificaciones de los Términos y Condiciones:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'El equipo de PrediHipertensión se reserva el derecho de modificar estos términos y condiciones en cualquier momento y sin previo aviso. Las modificaciones entrarán en funcionamiento inmediatamente después de su publicación en la aplicación. El uso continuado de la aplicación después de la publicación de los cambios constituirá la aceptación de dichos cambios por parte del usuario.',
                      color: GlobalColors.bgDark1,
                    ),
                    Subtitle(
                      subtitulo: "9. Protección de Datos y Privacidad:",
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'La seguridad y privacidad de tus datos son fundamentales para nosotros. La información que compartas con la aplicación se manejará de acuerdo con nuestra Política de Privacidad. Nos comprometemos a proteger tus datos y a no compartir información personal sin tu consentimiento.',
                      color: GlobalColors.bgDark1,
                    ),
                    Parragraph(
                      parrafo:
                          'Al utilizar la aplicación PrediHipertensión, aceptas cumplir con estos términos y condiciones. Si no estás de acuerdo con alguno de estos términos, por favor, abstente de utilizar la aplicación. Si tienes alguna pregunta o inquietud sobre estos términos y condiciones, por favor contáctanos en [correo electrónico de soporte].',
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
