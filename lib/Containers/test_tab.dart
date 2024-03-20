// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:predihipertension/Services/function_api.dart';
import 'package:predihipertension/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Utilities/testLogic.dart';
import 'package:predihipertension/Utilities/title_tab.dart';

import 'package:predihipertension/Utilities/paragraph.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Components/custom_card.dart';

import 'package:predihipertension/Components/custom_dropdown.dart';
import 'package:predihipertension/Components/custom_numberfield.dart';
import 'package:predihipertension/Utilities/dialog_calcimc.dart';

class TestTab extends StatefulWidget {
  const TestTab({super.key});

  @override
  State<TestTab> createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> {
  /// Informacion personal
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController genhlthController = TextEditingController();
  TextEditingController menthlthController = TextEditingController();
  TextEditingController physhlthController = TextEditingController();
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
                        const Parragraph(parrafo: '1. ¿Cuántos años tienes?'),
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
                        const Parragraph(parrafo: '2. ¿Cuál es tu género?'),
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
                        const Parragraph(
                            parrafo:
                                '3. ¿Cuál es tu Índice de Masa Corporal (IMC)?'),
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
                        const Parragraph(
                            parrafo:
                                '4. Diría usted que en general su salud es:'),
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
                        const Parragraph(
                            parrafo:
                                '5. ¿¿Durante cuántos días en el último mes considera que su salud mental no fue buena? (Incluya estrés, depresión y problemas emocionales)'),
                        const SizedBox(height: 5.0),
                        CustomNumberField(
                          hintText: 'Ingrese la cantidad de días',
                          enabled: true,
                          showNextButton: true,
                          cifras: 2,
                          controller: menthlthController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            int dias = int.tryParse(value) ?? 0;
                            if (dias > 30) {
                              return 'No debe exceder más de 30 días';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 15.0),

                        /// Salud mental percibida en los ultimos 30 dias
                        const Parragraph(
                            parrafo:
                                '6. ¿Durante cuántos días en el último mes considera que su salud física no fue buena? (Incluya enfermedades y lesiones físicas)'),
                        const SizedBox(height: 5.0),
                        CustomNumberField(
                          hintText: 'Ingrese la cantidad de días',
                          enabled: true,
                          showNextButton: true,
                          cifras: 2,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            int dias = int.tryParse(value) ?? 0;
                            if (dias > 30) {
                              return 'No debe exceder más de 30 días';
                            }
                            return null;
                          },
                          controller: physhlthController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Dificultad para caminar o subir escaleras
                        const Parragraph(
                            parrafo:
                                '7. ¿Tiene dificultades graves para caminar o subir escaleras?'),
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
                        const Parragraph(
                            parrafo:
                                '8. ¿Consume fruta al menos una vez al día?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: fruitController.text,
                          controller: fruitController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de vegetales
                        const Parragraph(
                            parrafo:
                                '9. ¿Comes verduras al menos una vez al día?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: vegetableController.text,
                          controller: vegetableController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de cigarros
                        const Parragraph(
                            parrafo:
                                '10. ¿Has fumado al menos 100 cigarrillos en tu vida? \n* Nota: 5 paquetes = 100 cigarrillos'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: smokeController.text,
                          controller: smokeController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Consumo de alcohol
                        const Parragraph(
                            parrafo:
                                '11. ¿Consumes alcohol muy frecuentemente? \n* Hombres > 14 tragos por semana. \n* Mujeres > 7 tragos por semana.'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: drinkController.text,
                          controller: drinkController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Actividad fisica del usuario
                        const Parragraph(
                            parrafo:
                                '12.  ¿Ha hecho ejercicio fuera de su trabajo habitual en los últimos 30 días?'),
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
                        const Parragraph(
                            parrafo:
                                '13. ¿Un profesional de la salud le ha indicado que tiene colesterol alto en la sangre?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: toldCholController.text,
                          controller: toldCholController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Control de colesterol en los últimos cinco años
                        const Parragraph(
                            parrafo:
                                '14. ¿Ha realizado un control de colesterol en los últimos 5 años?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: checkCholController.text,
                          controller: checkCholController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Paciente Diabetico
                        const Parragraph(
                            parrafo:
                                '15. ¿Cuál es tu estado actual de diabetes?'),
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

                        const Parragraph(
                            parrafo:
                                '16. ¿Has tenido alguna vez un accidente cerebrovascular (ACV)?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Sí', 'No'],
                          defaultValue: strokeController.text,
                          controller: strokeController,
                        ),

                        const SizedBox(height: 15.0),

                        const Parragraph(
                            parrafo:
                                '17. ¿Has padecido alguna vez de enfermedad coronaria o infarto de miocardio?'),
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
    Map<String, String> body = await testLogic.construirBody(
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
    );

    try {
      final response = await HttpService.postTest(body);
      if (response.statusCode == 200) {
        CustomDialogs.mostrarResultadoTest(context, response.body);
        _limpiarCampos();
      } else {
        throw Exception('Error en la solicitud HTTP');
      }
    } catch (error) {
      CustomDialogs.showErrorDialog(
        context,
        'Mensaje',
        'No se pudo evaluar su resultado: $error',
      );
      // print('No se pudo evaluar su resultado: $error');
    }
  }
}
