// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../Core/Services/function_api.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Domain/Logic/testlogic.dart';
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
  String phisicalHealthResponse = '';

  /// Informacion personal
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController genhlthController = TextEditingController();
  TextEditingController menthlthController = TextEditingController();
  TextEditingController diasmenthlthController = TextEditingController();
  TextEditingController physhlthController = TextEditingController();
  TextEditingController diasphyshlthController = TextEditingController();
  TextEditingController diffWalkController = TextEditingController();
  TextEditingController fruitController = TextEditingController();
  TextEditingController vegetableController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController drinkController = TextEditingController();
  TextEditingController physactivityController = TextEditingController();
  TextEditingController toldCholController = TextEditingController();
  TextEditingController checkCholController = TextEditingController();
  TextEditingController strokeController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController heartController = TextEditingController();

  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    ageController.addListener(_validarFormulario);
    sexController.addListener(_validarFormulario);
    bmiController.addListener(_validarFormulario);
    genhlthController.addListener(_validarFormulario);
    menthlthController.addListener(_validarFormulario);
    physhlthController.addListener(_validarFormulario);
    diffWalkController.addListener(_validarFormulario);
    fruitController.addListener(_validarFormulario);
    vegetableController.addListener(_validarFormulario);
    smokeController.addListener(_validarFormulario);
    drinkController.addListener(_validarFormulario);
    physactivityController.addListener(_validarFormulario);
    toldCholController.addListener(_validarFormulario);
    checkCholController.addListener(_validarFormulario);
    strokeController.addListener(_validarFormulario);
    diabetesController.addListener(_validarFormulario);
    heartController.addListener(_validarFormulario);
  }

  void _limpiarCampos() {
    ageController.clear();
    sexController.clear();
    bmiController.clear();
    genhlthController.clear();
    menthlthController.clear();
    physhlthController.clear();
    diffWalkController.clear();
    fruitController.clear();
    vegetableController.clear();
    smokeController.clear();
    drinkController.clear();
    physactivityController.clear();
    toldCholController.clear();
    checkCholController.clear();
    strokeController.clear();
    diabetesController.clear();
    heartController.clear();
  }

  @override
  void dispose() {
    ageController.dispose();
    sexController.dispose();
    bmiController.dispose();
    genhlthController.dispose();
    menthlthController.dispose();
    physhlthController.dispose();
    diffWalkController.dispose();
    fruitController.dispose();
    vegetableController.dispose();
    smokeController.dispose();
    drinkController.dispose();
    physactivityController.dispose();
    toldCholController.dispose();
    checkCholController.dispose();
    strokeController.dispose();
    diabetesController.dispose();
    heartController.dispose();
    super.dispose();
  }

  void _validarFormulario() {
    final bool isValid = ageController.text.isNotEmpty &&
        sexController.text.isNotEmpty &&
        bmiController.text.isNotEmpty &&
        genhlthController.text.isNotEmpty &&
        menthlthController.text.isNotEmpty &&
        physhlthController.text.isNotEmpty &&
        diffWalkController.text.isNotEmpty &&
        fruitController.text.isNotEmpty &&
        vegetableController.text.isNotEmpty &&
        smokeController.text.isNotEmpty &&
        drinkController.text.isNotEmpty &&
        physactivityController.text.isNotEmpty &&
        toldCholController.text.isNotEmpty &&
        checkCholController.text.isNotEmpty &&
        diabetesController.text.isNotEmpty &&
        strokeController.text.isNotEmpty &&
        heartController.text.isNotEmpty;

    setState(() {
      isButtonActive = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    title: 'Información personal',
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
                              '3. ¿Cuál es su Índice de Masa Corporal (IMC)?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomNumberField(
                                hintText: 'Calcule o ingrese su IMC',
                                enabled: true,
                                cifras: 5,
                                controller: bmiController,
                              ),
                            ),
                            IconButton(
                              onPressed: _calcularIMCDialog,
                              icon: Icon(
                                Icons.calculate,
                                color: GlobalColors.hintText,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15.0),

                        /// Estado general percibido de salud del usuario
                        Parragraph(
                          parrafo: '4. Diría usted que en general su salud es:',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'Excelente',
                            'Muy bueno',
                            'Bueno',
                            'Regular',
                            'Deficiente',
                          ],
                          defaultValue: genhlthController.text,
                          controller: genhlthController,
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
                                '** Si su respuesta fue Sí, indique cuántos días ha presentado los problemas anteriores:',
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

                        /// Salud fisica percibida en los ultimos 30 dias
                        Parragraph(
                          parrafo:
                              '6. En el último mes, ¿has padecido de enfermedades o lesiones físicas?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: physhlthController.text,
                          controller: physhlthController,
                          onChanged: (String? newValue) {
                            setState(() {
                              phisicalHealthResponse = newValue ?? '';
                            });
                          },
                        ),

                        const SizedBox(height: 15.0),

                        // Segundo párrafo condicional basado en el valor seleccionado en la pregunta 5
                        if (phisicalHealthResponse == 'Sí') ...[
                          Parragraph(
                            parrafo:
                                '** Si su respuesta fue Sí, indique cuántos días ha presentado los problemas anteriores:',
                            color: GlobalColors.textColor,
                          ),
                          const SizedBox(height: 5.0),
                          CustomNumberField(
                            hintText: 'Ingrese la cantidad de días',
                            enabled: true,
                            showNextButton: true,
                            cifras: 2,
                            controller: diasphyshlthController,
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

                        /// Dificultad para caminar o subir escaleras
                        Parragraph(
                          parrafo:
                              '7. ¿Presenta dificultades para caminar o subir escaleras?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: diffWalkController.text,
                          controller: diffWalkController,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /// Card Hábitos y Estilos de vida
                  CustomCard(
                    title: 'Hábitos y Estilos de Vida',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Consumo de frutas
                        Parragraph(
                          parrafo: '8. ¿Consume fruta al menos una vez al día?',
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
                              '9. ¿Consume verduras al menos una vez al día?',
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

                        /// Consumo de cigarros
                        Parragraph(
                          parrafo: '10. ¿Has fumado al menos 100 cigarrillos?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: smokeController.text,
                          controller: smokeController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de alcohol
                        Parragraph(
                          parrafo:
                              '11. ¿Consume bebidas alcoholicas actualmente?',
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

                        /// Actividad fisica del usuario
                        Parragraph(
                          parrafo:
                              '12.  ¿Sueles hacer al menos 30 minutos de actividad física en tu trabajo o en tu tiempo libre de forma regular?',
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

                  /// Card Historial Médico
                  CustomCard(
                    title: 'Historial Médico',
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

                        /// Control de colesterol en los últimos cinco años
                        Parragraph(
                          parrafo:
                              '14. ¿Has hecho un examen para revisar tu nivel de colesterol en sangre en los últimos cinco años?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: checkCholController.text,
                          controller: checkCholController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Paciente Diabetico
                        Parragraph(
                          parrafo: '15. ¿Tienes diagnóstico de diabetes?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'Sin diabetes',
                            'Prediabetes',
                            'Diabetes',
                          ],
                          defaultValue: diabetesController.text,
                          controller: diabetesController,
                        ),

                        const SizedBox(height: 15.0),

                        Parragraph(
                          parrafo:
                              '16. ¿Alguna vez has experimentado síntomas repentinos como debilidad, dificultad para hablar o pérdida de visión que afectaron tu capacidad para funcionar normalmente?',
                          color: GlobalColors.textColor,
                        ),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: strokeController.text,
                          controller: strokeController,
                        ),

                        const SizedBox(height: 15.0),

                        Parragraph(
                          parrafo:
                              '17. ¿Alguna vez has tenido problemas de salud relacionados con tu corazón?"',
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

  void _mostrarResultadoDialog() async {
    TestLogic testLogic = TestLogic();
    Map<String, String> body;

    String diasSaludMentalValue =
        mentalHealthResponse == 'Sí' ? diasmenthlthController.text : '0';
    String diasSaludFisicaValue =
        phisicalHealthResponse == 'Sí' ? diasphyshlthController.text : '0';

    body = await testLogic.construirBody(
      edad: ageController.text,
      genero: sexController.text,
      imc: bmiController.text,
      saludGeneral: genhlthController.text,
      saludMental: menthlthController.text,
      saludFisica: physhlthController.text,
      dificultadCaminar: diffWalkController.text,
      consumoFrutas: fruitController.text,
      consumoVerduras: vegetableController.text,
      consumoCigarros: smokeController.text,
      consumoAlcohol: drinkController.text,
      actividadFisica: physactivityController.text,
      colesterol: toldCholController.text,
      chequeoColesterol: checkCholController.text,
      acv: strokeController.text,
      diabetes: diabetesController.text,
      enfermedadCardiaca: heartController.text,
      diasSaludMental: diasSaludMentalValue,
      diasSaludFisica: diasSaludFisicaValue,
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
