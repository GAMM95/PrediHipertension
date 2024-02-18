import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa la librería de formateo de fechas
import 'package:predihipertension/Services/methods_auth.dart';
import '../Screens/detalletest_screen.dart';
import '../Theme/global_colors.dart';
import '../Components/custom_card.dart'; // Importa el servicio FirestoreService

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
        Container(
          color: GlobalColors.bgPanelDark2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Historial de consultas',
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
                    title: 'Fechas de Test',
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
                            return Column(
                              children: dates.map((date) {
                                return ListTile(
                                  title: Text(
                                    DateFormat('dd/MM/yyyy - HH:mm a')
                                        .format(date),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    // icon: Icon(
                                    //   Icons.info_outline,
                                    //   color: GlobalColors.cardColor,
                                    // ),
                                    // onPressed: () {
                                    //   Navigator.of(context)
                                    //       .pushNamed('/detalletest');
                                    // },
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
