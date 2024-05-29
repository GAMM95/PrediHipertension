import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';
import '../../Core/Utils/composicion_corporal.dart';
import 'custom_numberfielddark.dart';
import 'paragraph.dart';

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  late TextEditingController pesoController;
  late TextEditingController alturaController;
  late TextEditingController resultadoController;
  Color textColor = Colors.black;
  bool mostrarTextoFinal = false;

  @override
  void initState() {
    super.initState();
    pesoController = TextEditingController();
    alturaController = TextEditingController();
    resultadoController = TextEditingController();
  }

  void limpiar() {
    pesoController.clear();
    alturaController.clear();
    resultadoController.clear();
    setState(() {
      mostrarTextoFinal = false;
    });
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    resultadoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgDark1,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 252, 253),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Calculadora de Índice de Masa Corporal (IMC)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: GlobalColors.titlePrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Parragraph(
                      parrafo:
                          'Para calcular su índice de masa corporal, ingrese su estatura y peso.',
                      color: GlobalColors.bgDark1,
                    ),
                    const SizedBox(height: 15.0),
                    CustomNumberFieldDark(
                      hintText: 'Ingrese su peso en kg',
                      enabled: true,
                      cifras: 5,
                      label: const Text('Peso (kg)'),
                      validator: 'Ingrese su peso',
                      controller: pesoController,
                      showNextButton: true,
                    ),
                    const SizedBox(height: 10),
                    CustomNumberFieldDark(
                      hintText: 'Ingrese su altura en m',
                      enabled: true,
                      cifras: 4,
                      label: const Text('Altura (m)'),
                      validator: 'Ingrese su altura',
                      controller: alturaController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final peso =
                                double.tryParse(pesoController.text) ?? 0.0;
                            final altura =
                                double.tryParse(alturaController.text) ?? 0.0;

                            if (peso > 0 && altura > 0) {
                              final imc = peso / (altura * altura);
                              resultadoController.text = imc.toStringAsFixed(2);
                              String composicion = ComposicionCorporal.obtenerComposicion(imc);

                              // Mostrar la composición corporal en el resultado
                              resultadoController.text += '\n$composicion';
                              setState(() {
                                if (composicion == 'Peso inferior al normal') {
                                  textColor = GlobalColors.pesoBajo;
                                } else if (composicion == 'Peso normal') {
                                  textColor = GlobalColors.pesoNormal;
                                } else if (composicion == 'Sobrepeso') {
                                  textColor = GlobalColors.sobrepeso;
                                } else if (composicion == 'Obesidad Grado I o moderada') {
                                  textColor = GlobalColors.obeso1;
                                } else if (composicion == 'Obesidad Grado II o severa') {
                                  textColor = GlobalColors.obeso2;
                                } else {
                                  textColor = GlobalColors.obeso3;
                                }
                                mostrarTextoFinal = true;
                              });
                            }
                          },
                          child: const Text('Calcular'),
                        ),
                        const SizedBox(width: 10.0),
                        IconButton(
                          onPressed: limpiar,
                          icon: Icon(
                            Icons.restart_alt_rounded,
                            color: GlobalColors.titlePrimaryColor,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomNumberFieldDark(
                      hintText: 'Resultado',
                      enabled: false,
                      cifras: 4,
                      label: const Text('Resultado'),
                      validator: 'Resultado',
                      controller: resultadoController,
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: mostrarTextoFinal,
                      child: Text(
                        resultadoController.text.split('\n').last,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
