// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:predihipertension/Services/methods_firebase.dart';
import 'package:predihipertension/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Utilities/title_tab.dart';
import 'package:predihipertension/Screens/detalletest_screen.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Components/custom_card.dart';

/// Widget para mostrar un historial de fechas de consultas.
class HistorialTab extends StatefulWidget {
  const HistorialTab({super.key});

  @override
  State<HistorialTab> createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  final MethodsAuth _methodsAuth = MethodsAuth();

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
                  child: CustomCard(
                    title: 'Fecha y hora de Test',
                    child: FutureBuilder<List<DateTime>>(
                      future: _methodsAuth.getDataTestDates(),
                      builder:
                          (context, AsyncSnapshot<List<DateTime>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Muestra un indicador de carga mientras se obtienen los datos.
                          return const Center(
                              child: CircularProgressIndicator());
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
                                return ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      DateFormat('dd/MM/yyyy - hh:mm a')
                                          .format(date),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Botón para ver detalles del test.
                                      IconButton(
                                        icon: Icon(
                                          Icons.info_outline,
                                          color: GlobalColors.cardColor,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetalleTest(date: date),
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
                                                .deleteTestByDateTime(date);
                                            // Muestra un diálogo de éxito tras la eliminación.
                                            CustomDialogs.showCorrectDialog(
                                              context,
                                              'Mensaje',
                                              'Se eliminó test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
                                            );
                                            // Actualiza la interfaz tras la eliminación.
                                            setState(() {});
                                          } catch (error) {
                                            // Muestra un diálogo de error si la eliminación falla.
                                            CustomDialogs.showErrorDialog(
                                              context,
                                              'Advertencia',
                                              'No se pudo eliminar test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            // Muestra un mensaje cuando no hay tests disponibles.
                            return Container(
                              height: 40.0,
                              alignment: Alignment.center,
                              child: const Text(
                                'Usted no tiene ningún test',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
          ),
        ],
      ),
    );
  }
}
