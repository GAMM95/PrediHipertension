// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../Models/datatest.dart';
import '../Services/methods_auth.dart';
import '../Theme/global_colors.dart';
import '../Components/custom_card.dart';

import '../Components/custom_dropdown.dart';
import '../Components/custom_numberfield.dart';
import '../Utilities/dialog_calcimc.dart';
import '../Utilities/dialog_resulttest.dart';

class TestTab extends StatefulWidget {
  const TestTab({super.key});

  @override
  State<TestTab> createState() => _TestTabState();
}

class _TestTabState extends State<TestTab> {
  TextEditingController edadController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController imcController = TextEditingController();

  final MethodsAuth _methodsAuth = MethodsAuth();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: GlobalColors.bgPanelDark2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Test de Hipertensión Arterial',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: GlobalColors.titlePanel,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: GlobalColors.bgDark2,
              ),
              child: Column(
                children: [
                  CustomCard(
                    title: 'Información personal',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomNumberField(
                          hintText: 'Ingrese su edad',
                          enabled: true,
                          cifras: 2,
                          label: const Text('Edad'),
                          validator: 'Ingrese su edad',
                          controller: edadController,
                        ),
                        const SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: const Text('Género'),
                          items: const ['Masculino', 'Femenino'],
                          defaultValue: generoController.text,
                          controller: generoController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  CustomCard(
                    title: 'Salud Física y Mental',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomNumberField(
                                hintText: 'Ingrese su IMC',
                                enabled: true,
                                cifras: 5,
                                label:
                                    const Text('Índice de Masa Corporal (IMC)'),
                                validator: 'Ingrese su IMC',
                                controller: imcController,
                              ),
                            ),
                            IconButton(
                              onPressed: _calcularIMCDialog,
                              icon: Icon(
                                Icons.info_outline,
                                color: GlobalColors.hintText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        const CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('Salud física percibida'),
                          items: ['Bueno', 'Regular', 'Malo'],
                        ),
                        const SizedBox(height: 15.0),
                        const CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('Salud mental percibida'),
                          items: ['Bueno', 'Regular', 'Malo'],
                        ),
                        const SizedBox(height: 15.0),
                        const CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('Dificultad para caminar'),
                          items: ['Si', 'No'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomCard(
                    title: 'Estilos de Vida y Hábitos',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Eres fumador?'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Realizas actividad física?'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Consumes alcohol?'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Consumes frutas?'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Consumes verduras?'),
                          items: ['Si', 'No'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomCard(
                    title: 'Historial Médico',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('Nivel de colesterol'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('Frecuencia de chequeo de colesterol'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Has presentado ataques cardiacos?'),
                          items: ['Si', 'No'],
                        ),
                        SizedBox(height: 15.0),
                        CustomDropDown(
                          hintText: 'Seleccione una opción',
                          label: Text('¿Eres paciente diabético?'),
                          items: ['Si', 'No'],
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
                        onPressed: _mostrarResultadoDialog,
                        child: const Text(
                          'Evaluar',
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarResultadoDialog() async {
    try {
      // Crear un objeto Datatest con los datos del formulario
      Datatest datatest = Datatest(
        age: int.tryParse(edadController.text) ?? 0,
        genere: generoController.text == 'Masculino'
            ? 0
            : 1, // Assuming 0 for Male and 1 for Female
        imc: double.tryParse(imcController.text) ?? 0.0,
      );

      // Guardar datos del test en Firestore
      await _methodsAuth.guardarTest(datatest: datatest);

      // Mostrar el diálogo de resultado
      ResultadoDialog.mostrar(context);
    } catch (error) {
      // Manejar errores
      // print('Error al guardar el test: $error');
      // Mostrar un mensaje de error al usuario si lo deseas
    }
  }

  void _calcularIMCDialog() {
    CalculoIMC.mostrar(context, imcController);
  }
}
