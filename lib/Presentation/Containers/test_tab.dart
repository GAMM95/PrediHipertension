// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';

import '../../Core/Services/function_api.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Domain/Logic/testlogic.dart';
import '../Utilities/advertencia_test.dart';
import '../Utilities/custom_dialogs.dart';
import '../Utilities/dialog_calcimc.dart';
import '../Widget/custom_card.dart';
import '../Widget/custom_dropdown.dart';
import '../Widget/custom_numberfield.dart';
import '../Widget/paragraph.dart';
import '../Widget/title_tab.dart';

class TestTab extends StatefulWidget {
  const TestTab({super.key});

  @override
  State<TestTab> createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> {
  String mentalHealthResponse = '';
  String genderSelection = '';
  String alcoholQuestion = '12. ¿Te consideras un bebedor compulsivo?';

  /// Informacion personal
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController menthlthController = TextEditingController();
  TextEditingController diasmenthlthController = TextEditingController();
  TextEditingController fruitController = TextEditingController();
  TextEditingController vegetableController = TextEditingController();
  TextEditingController saltController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController drinkController = TextEditingController();
  TextEditingController compulsiveDrinkController = TextEditingController();
  TextEditingController physactivityController = TextEditingController();
  TextEditingController toldCholController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController heartController = TextEditingController();

  bool isButtonActive = false;
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    ageController.addListener(_validarFormulario);
    sexController.addListener(_validarFormulario);
    educationController.addListener(_validarFormulario);
    bmiController.addListener(_validarFormulario);
    menthlthController.addListener(_validarFormulario);
    fruitController.addListener(_validarFormulario);
    vegetableController.addListener(_validarFormulario);
    saltController.addListener(_validarFormulario);
    smokeController.addListener(_validarFormulario);
    drinkController.addListener(_validarFormulario);
    compulsiveDrinkController.addListener(_validarFormulario);
    physactivityController.addListener(_validarFormulario);
    toldCholController.addListener(_validarFormulario);
    diabetesController.addListener(_validarFormulario);
    heartController.addListener(_validarFormulario);
  }

  void _limpiarCampos() {
    ageController.clear();
    sexController.clear();
    educationController.clear();
    bmiController.clear();
    menthlthController.clear();
    fruitController.clear();
    vegetableController.clear();
    saltController.clear();
    smokeController.clear();
    drinkController.clear();
    compulsiveDrinkController.clear();
    physactivityController.clear();
    toldCholController.clear();
    diabetesController.clear();
    heartController.clear();
  }

  @override
  void dispose() {
    ageController.dispose();
    sexController.dispose();
    educationController.dispose();
    bmiController.dispose();
    menthlthController.dispose();
    fruitController.dispose();
    vegetableController.dispose();
    saltController.dispose();
    smokeController.dispose();
    drinkController.dispose();
    compulsiveDrinkController.dispose();
    physactivityController.dispose();
    toldCholController.dispose();
    diabetesController.dispose();
    heartController.dispose();
    super.dispose();
  }

  void _validarFormulario() {
    final bool isValid = ageController.text.isNotEmpty &&
        sexController.text.isNotEmpty &&
        educationController.text.isNotEmpty &&
        bmiController.text.isNotEmpty &&
        menthlthController.text.isNotEmpty &&
        fruitController.text.isNotEmpty &&
        vegetableController.text.isNotEmpty &&
        saltController.text.isNotEmpty &&
        smokeController.text.isNotEmpty &&
        drinkController.text.isNotEmpty &&
        compulsiveDrinkController.text.isNotEmpty &&
        physactivityController.text.isNotEmpty &&
        toldCholController.text.isNotEmpty &&
        diabetesController.text.isNotEmpty &&
        heartController.text.isNotEmpty;

    setState(() {
      isButtonActive = isValid;
    });
  }

  void updateAlcoholQuestion() {
    // Lógica para determinar qué pregunta de alcohol mostrar basada en las respuestas anteriores
    if (genderSelection == 'Masculino') {
      alcoholQuestion =
          '12. ¿Has consumido cinco o más bebidas alcohólicas en una sola ocasión?';
    } else if (genderSelection == 'Femenino') {
      alcoholQuestion =
          '12. ¿Has consumido cuatro o más bebidas alcohólicas en una sola ocasión?';
    } else {
      // Género no seleccionado, mostrar una pregunta genérica
      alcoholQuestion = '12. ¿Te consideras un bebedor compulsivo?';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mostrar el diálogo de advertencia antes de mostrar la pantalla TestTab
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_dialogShown) {
        AdvertenciaTest.mostrar(context);
        _dialogShown = true; // Marcar que el diálogo ha sido mostrado
      }
    });

    return Column(
      children: [
        const TituloTab(titulo: 'Test de Hipertensión Arterial'),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: GlobalColors.bgDark2,
              ),
              child: Column(
                children: [
                  /// Card Informacion Personal
                  CustomCard(
                    title: 'Datos demográficos',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Edad del usuario
                        Parragraph(
                          parrafo: '1. ¿Cuántos años tienes?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomNumberField(
                          hintText: 'Ingrese su edad',
                          enabled: true,
                          cifras: 2,
                          // validator: 'Ingrese su edad',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            int edad = int.tryParse(value) ?? 0;
                            if (edad < 18) {
                              return 'Usted es menor de edad';
                            }
                            return null;
                          },
                          showNextButton: true,
                          controller: ageController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Género del usuario
                        Parragraph(
                          parrafo: '2. Seleccione su género',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Masculino', 'Femenino'],
                          defaultValue: sexController.text,
                          controller: sexController,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                genderSelection = newValue;
                                updateAlcoholQuestion();
                              });
                            }
                          },
                        ),

                        const SizedBox(height: 15.0),

                        /// Nivel educativo logrado por el usuario
                        Parragraph(
                          parrafo:
                              '3. ¿Cuál es el nivel educativo más alto que has alcanzado?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'No tengo',
                            'Educación inicial',
                            'Primaria completa',
                            'Secundaria incompleta',
                            'Secundaria completa',
                            'Estudios técnicos',
                            'Universitaria incompleta',
                            'Universitaria completa',
                          ],
                          defaultValue: educationController.text,
                          controller: educationController,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /// Card Salud Física y Mental
                  CustomCard(
                    title: 'Salud Física y Mental',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Indice de Masa Corporal del usuario
                        Parragraph(
                          parrafo:
                              '4. ¿Cuál es su Índice de Masa Corporal (IMC)?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _calcularIMCDialog,
                              icon: Icon(
                                Icons.calculate,
                                color: GlobalColors.hintText,
                                size: 50.0,
                              ),
                            ),
                            Expanded(
                              child: CustomNumberField(
                                hintText: 'Calcule su IMC',
                                enabled: false,
                                cifras: 5,
                                controller: bmiController,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15.0),

                        /// Salud mental percibida en los ultimos 30 dias
                        Parragraph(
                          parrafo:
                              '5. En el último mes, ¿has experimentado estrés, depresión u otros problemas emocionales?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: menthlthController.text,
                          controller: menthlthController,
                          onChanged: (String? newValue) {
                            setState(() {
                              mentalHealthResponse = newValue ?? '';
                            });
                          },
                        ),

                        const SizedBox(height: 15.0),

                        // Segundo párrafo condicional basado en el valor seleccionado en la pregunta 5
                        if (mentalHealthResponse == 'Sí') ...[
                          Parragraph(
                            parrafo:
                                '** Si su respuesta fue Sí, indique cuántos días aproximadamente ha presentado los problemas anteriores:',
                            color: GlobalColors.textColor,
                          ),
                          const SizedBox(height: 5.0),
                          CustomNumberField(
                            hintText: 'Ingrese la cantidad de días',
                            enabled: true,
                            showNextButton: true,
                            cifras: 2,
                            controller: diasmenthlthController,
                            // controller: menthlthController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              int dias = int.tryParse(value) ?? 0;
                              if (dias < 1 || dias > 30) {
                                return 'El valor debe ser entre 1 y 30 días';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0),
                        ],

                        /// Actividad fisica del usuario
                        Parragraph(
                          parrafo:
                              '6.  ¿Sueles hacer al menos 30 minutos diarios de actividad física?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: physactivityController.text,
                          controller: physactivityController,
                        ),

                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /// Card Hábitos Alimenticios
                  CustomCard(
                    title: 'Hábitos Alimenticios',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Consumo de frutas
                        Parragraph(
                          parrafo: '7. ¿Consume fruta al menos una vez al día?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: fruitController.text,
                          controller: fruitController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de vegetales
                        Parragraph(
                          parrafo:
                              '8. ¿Consume verduras al menos una vez al día?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: vegetableController.text,
                          controller: vegetableController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de sal
                        Parragraph(
                          parrafo:
                              '9. ¿Esta usted actualmente controlando o reduciendo su consumo de sal?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: saltController.text,
                          controller: saltController,
                        ),

                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /// Card Hábitos y Estilos de vida
                  CustomCard(
                    title: 'Hábitos de Estilos de Vida',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Consumo de cigarros
                        Parragraph(
                          parrafo:
                              '10. ¿Cual de las siguientes opciones describe su hábito de fumar?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          // items: const ['Sí', 'No'],
                          items: const [
                            'Fumo a diario',
                            'Fumo ocasionalmente',
                            'He dejado de fumar',
                            'No fumo',
                          ],
                          defaultValue: smokeController.text,
                          controller: smokeController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de alcohol
                        Parragraph(
                          parrafo:
                              '11. ¿Ha consumido al menos una bebida alcoholica en los ultimos 30 días?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: drinkController.text,
                          controller: drinkController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de alcohol
                        Parragraph(
                          parrafo: alcoholQuestion,
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'], // Opciones por defecto
                          controller: compulsiveDrinkController,
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /// Card Historial Médico
                  CustomCard(
                    title: 'Diagnósticos Médicos',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///  Le han dicho que su colesterol en sangre es alto?
                        Parragraph(
                          parrafo:
                              '13. ¿Alguna vez un médico te ha dicho que tienes niveles elevados de colesterol en la sangre?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: toldCholController.text,
                          controller: toldCholController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Paciente Diabetico
                        Parragraph(
                          parrafo:
                              '14. ¿Cuál de las siguientes opciones describe mejor su diagnóstico en relación con la diabetes?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'No tengo diagnóstico de diabetes',
                            'Tengo diagnóstico de diabetes',
                            'No sé',
                          ],
                          defaultValue: diabetesController.text,
                          controller: diabetesController,
                        ),

                        const SizedBox(height: 15.0),

                        Parragraph(
                          parrafo:
                              '15. ¿Alguna vez ha padecido de un ataque cardiaco o también llamado infarto de miocardio?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: heartController.text,
                          controller: heartController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.red[700],
                            disabledBackgroundColor: Colors.red[50]),
                        onPressed:
                            isButtonActive ? _mostrarResultadoDialog : null,
                        child: const Text(
                          'Evaluar',
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ),
      ],
    );
  }

  void _calcularIMCDialog() {
    CalculoIMC.mostrar(context, bmiController);
  }

  /// Muestra un diálogo de carga mientras se realiza una solicitud HTTP y
  /// presenta los resultados o un mensaje de error según corresponda.
  void _mostrarResultadoDialog() async {
    // Instancia de la lógica del test
    TestLogic testLogic = TestLogic();
    Map<String, String> body;

    // Determina el valor de los días de salud mental
    String diasSaludMentalValue =
        mentalHealthResponse == 'Sí' ? diasmenthlthController.text : '0';

    // Construye el cuerpo de la solicitud con los datos de los controladores
    body = await testLogic.construirBody(
      edad: ageController.text,
      genero: sexController.text,
      educacion: educationController.text,
      imc: bmiController.text,
      consumoSal: saltController.text,
      saludMental: menthlthController.text,
      consumoFrutas: fruitController.text,
      consumoVerduras: vegetableController.text,
      consumoCigarros: smokeController.text,
      consumoAlcohol: drinkController.text,
      consumoAlcCompulsivo: compulsiveDrinkController.text,
      actividadFisica: physactivityController.text,
      colesterol: toldCholController.text,
      diabetes: diabetesController.text,
      ataqueCardiaco: heartController.text,
      diasSaludMental: diasSaludMentalValue,
    );

    // Mostrar el diálogo de carga antes de realizar la solicitud HTTP
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Realiza la solicitud HTTP usando el cuerpo construido
      final response = await HttpService.postTest(body);
      if (response.statusCode == 200) {
        // Cerrar el diálogo de carga
        Navigator.of(context).pop();

        // Mostrar el resultado del test
        CustomDialogs.mostrarResultadoTest(context, response.body);
        _limpiarCampos();
      } else {
        throw Exception('Error en la solicitud HTTP');
      }
    } catch (error) {
      // Cerrar el diálogo de carga
      Navigator.of(context).pop();

      // Mostrar un diálogo de error
      CustomDialogs.showErrorDialog(
        context,
        'Mensaje',
        'No se pudo evaluar su resultado: $error',
      );
    }
  }
}
