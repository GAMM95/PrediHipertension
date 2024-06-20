// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../Core/Services/methods_firebase.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Domain/Logic/resultlogic.dart';
import '../../Domain/Models/resultado.dart';
import '../Screens/detalletest_screen.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/title_tab.dart';

class HistorialTab extends StatefulWidget {
  const HistorialTab({super.key});

  @override
  State<HistorialTab> createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  final MethodsAuth _methodsAuth = MethodsAuth();
  final ResultLogic _resultLogic = ResultLogic();

  Future<String> _loadResultado(DateTime date) async {
    try {
      List<Resultado> resultadoList =
          await _methodsAuth.getResultadoPorTest(date);
      // Usar _resultLogic para obtener la clasificación del resultado
      return _resultLogic.getClassifiedResult(resultadoList.first.resultado);
    } catch (e) {
      return "Error al cargar el resultado";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgDark2,
      child: Column(
        children: [
          // Título para la pestaña de historial.
          const TituloTab(titulo: 'Historial de consultas'),

          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10.0,
                  ),
                  child: FutureBuilder<List<DateTime>>(
                    future: _methodsAuth.getDataTestDates(),
                    builder: (context, AsyncSnapshot<List<DateTime>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Muestra un indicador de carga mientras se obtienen los datos.
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // Muestra un mensaje de error si falla la obtención de datos.
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Extrae los datos del snapshot.
                        final dates = snapshot.data;
                        if (dates != null && dates.isNotEmpty) {
                          // Ordena las fechas en orden descendente.
                          dates.sort((a, b) => b.compareTo(a));
                          return Column(
                            children: dates.map((date) {
                              return Card(
                                color: GlobalColors.bgPanelDark2,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Lottie.asset(
                                            'assets/animations/heart_test.json',
                                            width: 80,
                                            height: 80,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                DateFormat('dd/MM/yyyy')
                                                    .format(date),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('hh:mm a')
                                                    .format(date),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FutureBuilder<String>(
                                            future: _loadResultado(date),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Text(
                                                  'Cargando...',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                );
                                              } else if (snapshot.hasError) {
                                                return const Text(
                                                  'Error al cargar resultado',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                );
                                              } else {
                                                // Ajustar el tamaño del texto según el resultado
                                                double fontSize = 16.0;
                                                return Text(
                                                  snapshot.data ?? '',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: fontSize,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Row(
                                            children: [
                                              // Botón para ver detalles del test.
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove_red_eye,
                                                  color: GlobalColors.cardColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetalleTest(
                                                              date: date),
                                                    ),
                                                  );
                                                },
                                              ),
                                              // Botón para eliminar el test.
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () async {
                                                  try {
                                                    // Intenta eliminar el test.
                                                    await _methodsAuth
                                                        .deleteTestByDateTime(
                                                            date);
                                                    // Muestra un diálogo de éxito tras la eliminación.
                                                    CustomDialogs
                                                        .showCorrectDialog(
                                                      context,
                                                      'Mensaje',
                                                      'Se eliminó test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
                                                    );
                                                    // Actualiza la interfaz tras la eliminación.
                                                    setState(() {});
                                                  } catch (error) {
                                                    // Muestra un diálogo de error si la eliminación falla.
                                                    CustomDialogs
                                                        .showErrorDialog(
                                                      context,
                                                      'Advertencia',
                                                      'No se pudo eliminar test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          // Muestra un mensaje cuando no hay tests disponibles.
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(
                                  'assets/animations/empty.json',
                                  width: 180,
                                  height: 180,
                                ),
                                const SizedBox(height: 5.0),
                                const Text(
                                  'Usted no tiene ningún test',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
