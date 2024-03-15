// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:predihipertension/Services/modelo_prediccion.dart';
import 'package:predihipertension/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Utilities/title_tab.dart';
import 'package:predihipertension/Utilities/logica.dart';
import 'package:predihipertension/Utilities/paragraph.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Components/custom_card.dart';

import 'package:predihipertension/Components/custom_dropdown.dart';
import 'package:predihipertension/Components/custom_numberfield.dart';
import 'package:predihipertension/Utilities/dialog_calcimc.dart';
import 'package:predihipertension/Utilities/dialog_resulttest.dart';

class TestTab extends StatefulWidget {
  const TestTab({super.key});

  @override
  State<TestTab> createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> {
  /// Informacion personal
  TextEditingController ageController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController incomeController = TextEditingController();

  /// Salud General y Salud Mental
  TextEditingController bmiController = TextEditingController();
  TextEditingController genhlthController = TextEditingController();
  TextEditingController menthlthController = TextEditingController();
  TextEditingController physhlthController = TextEditingController();
  TextEditingController diffWalkController = TextEditingController();

  // Hábitos y Estilos de vida
  TextEditingController fruitController = TextEditingController();
  TextEditingController vegetableController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController drinkController = TextEditingController();
  TextEditingController physactivityController = TextEditingController();

  /// Historial Medico
  TextEditingController toldCholController = TextEditingController();
  TextEditingController checkCholController = TextEditingController();
  TextEditingController strokeController = TextEditingController();
  TextEditingController diabetesController = TextEditingController();
  TextEditingController heartController = TextEditingController();

  ModeloPrediccion modelo = ModeloPrediccion();

  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    ageController.addListener(_validarFormulario);
    sexController.addListener(_validarFormulario);
    educationController.addListener(_validarFormulario);
    incomeController.addListener(_validarFormulario);
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

  @override
  void dispose() {
    ageController.dispose();
    sexController.dispose();
    educationController.dispose();
    incomeController.dispose();
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
        educationController.text.isNotEmpty &&
        incomeController.text.isNotEmpty &&
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
              // child: Form(
              // key: _formTestKey,
              child: Column(
                children: [
                  /// Card Informacion Personal
                  CustomCard(
                    title: 'Información personal',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Edad del usuario
                        const Parragraph(parrafo: '1. ¿Cuántos años tiene?'),
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
                        const Parragraph(parrafo: '2. ¿Cuál es su género?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const ['Masculino', 'Femenino'],
                          defaultValue: sexController.text,
                          controller: sexController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Nivel de eduacion alcanzado del usuario
                        const Parragraph(
                            parrafo:
                                '3. ¿Cuál es el grado o año escolar más alto que completó?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'Nunca asistió o solo jardín',
                            'Primaria completa',
                            'Secundaria incompleta',
                            'Secundaria completa',
                            'Educación técnica',
                            'Universitaria'
                          ],
                          defaultValue: educationController.text,
                          controller: educationController,
                        ),

                        const SizedBox(height: 15.0),

                        /// Ingreso promedio anual del usuario
                        const Parragraph(
                            parrafo:
                                '4. ¿Cuánto es su ingreso anual promedio en su hogar?'),
                        const SizedBox(height: 5.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          items: const [
                            'Menos de S/ 10,000',
                            'Menos de S/ 15,000',
                            'Menos de S/ 20,000',
                            'Menos de S/ 25,000',
                            'Menos de S/ 35,000',
                            'Menos de S/ 50,000',
                            'Menos de S/ 75,000',
                            'Mas de S/ 75,000',
                          ],
                          defaultValue: incomeController.text,
                          controller: incomeController,
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
                                '5. ¿Cuánto es su Índice de Masa Corporal?'),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomNumberField(
                                hintText: 'Ingrese su IMC',
                                enabled: true,
                                cifras: 5,
                                controller: bmiController,
                                // validator: 'Ingrese o calcule su IMC',
                                // validator: (String? value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '';
                                //   }
                                //   double imc = double.tryParse(value) ?? 0.0;
                                //   if (imc == 0) {
                                //     return 'Calcule su IMC';
                                //   }
                                //   if (value.isNotEmpty) {
                                //     return '';
                                //   }
                                //   return null;
                                // },
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
                                '6. Diría usted que en general su salud es:'),
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
                                '7. Pensando en su salud mental que incluye estrés, depresión y problemas emocionales. ¿Durante cuántos días del último mes su salud mental no fue buena?'),
                        const SizedBox(height: 5.0),
                        CustomNumberField(
                          hintText: 'Ingrese la cantidad de días',
                          enabled: true,
                          showNextButton: true,
                          cifras: 2,
                          // validator: 'Ingrese la cantidad de días',
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
                                '8. Pensando en su salud física, que incluye enfermedades y lesiones físicas. ¿Durante cuántos días del último mes su salud mental no fue buena?'),
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
                                '9. ¿Tiene serias dificultades para caminar o subir escaleras?'),
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
                                '10. ¿Consume fruta 1 o más veces al día?'),
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
                                '11. ¿Consume verduras 1 o más veces al día?'),
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
                                '12. ¿Has fumado al menos 100 cigarrillos en toda tu vida? \n* Nota: 5 paquetes = 100 cigarrillos'),
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
                                '13. ¿Te consideras un bebedor empedernido? \n* Hombres > 14 tragos por semana. \n* Mujeres > 7 tragos por semana.'),
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
                                '14 ¿Ha realizado actividad física o ejercicio durante los últimos 30 días fuera de su trabajo habitual?'),
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
                                '15 ¿Alguna vez un médico, enfermera u otro profesional de la salud le ha dicho que su colesterol en sangre es alto?'),
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
                                '16 ¿Ha realizado un control de colesterol en los últimos cinco años?'),
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
                                '17 ¿Cuál es tu estado actual de diabetes?'),
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
                                '18 ¿Has tenido alguna vez un accidente cerebrovascular?'),
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
                                '19 ¿Has padecido de una enfermedad coronaria o infarto de miocardio?'),
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

  void _mostrarResultadoDialog() async {
    TestLogic testLogic = TestLogic();
    try {
      await testLogic.guardarTest(
        /// Informacion personal
        edad: ageController.text,
        genero: sexController.text,
        educacion: educationController.text,
        ingresos: incomeController.text,

        /// Salud General y Salud Mental
        imc: bmiController.text,
        saludGeneral: genhlthController.text,
        saludMental: menthlthController.text,
        saludFisica: physhlthController.text,
        dificultadCaminar: diffWalkController.text,

        // Hábitos y Estilos de vida
        consumoFrutas: fruitController.text,
        consumoVerduras: vegetableController.text,
        consumoCigarros: smokeController.text,
        consumoAlcohol: drinkController.text,
        actividadFisica: physactivityController.text,

        /// Historial Medico
        colesterol: toldCholController.text,
        chequeoColesterol: checkCholController.text,
        acv: strokeController.text,
        diabetes: diabetesController.text,
        enfermedadCardiaca: heartController.text,
      );

      // Mostrar el diálogo de resultado
      ResultadoDialog.mostrar(context);
      setState(() {
        isButtonActive = false;
      });
    } catch (error) {
      // Manejar errores
      CustomDialogs.showErrorDialog(
          context, 'Mensaje', 'No se puedo evaluar su resultado');
    }
  }

  void _calcularIMCDialog() {
    CalculoIMC.mostrar(context, bmiController);
  }
}
