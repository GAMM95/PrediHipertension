// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Services/methods_auth.dart';
import '../Utilities/custom_dialogs.dart';
import '../Utilities/title_tab.dart';
import '../Screens/detalletest_screen.dart';
import '../Theme/global_colors.dart';
import '../Components/custom_card.dart';

class HistorialTab extends StatefulWidget {
  const HistorialTab({super.key});

  @override
  State<HistorialTab> createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  final MethodsAuth _methodsAuth = MethodsAuth();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TituloTab(titulo: 'Historial de consultas'),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: GlobalColors.bgDark2,
              ),
              child: Column(
                children: [
                  CustomCard(
                    title: 'Fecha y hora de Test',
                    child: FutureBuilder<List<DateTime>>(
                      future: _methodsAuth.getDataTestDates(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final dates = snapshot.data;
                          if (dates != null && dates.isNotEmpty) {
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
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          try {
                                            await _methodsAuth
                                                .deleteTestByDateTime(date);
                                            CustomDialogs.showCorrectDialog(
                                                context,
                                                'Mensaje',
                                                'Se eliminó test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}');
                                            setState(() {});
                                          } catch (error) {
                                            CustomDialogs.showErrorDialog(
                                                context,
                                                'Advertencia',
                                                'No se pudo eliminar test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}');
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
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
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
