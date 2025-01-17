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

  late Future<void> _dataFuture;

  int totalTests = 0;
  int highRiskTests = 0;
  int lowRiskTests = 0;
  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    _dataFuture = _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      totalTests = await _methodsAuth.countTests();
      dates = await _methodsAuth.getDataTestDates();

      highRiskTests = 0;
      lowRiskTests = 0;

      List<Future<void>> fetchResultsFutures = dates.map((date) async {
        List<Resultado> resultadoList =
            await _methodsAuth.getResultadoPorTest(date);
        if (resultadoList.isNotEmpty) {
          String classifiedResult =
              _resultLogic.getClassifiedResult(resultadoList.first.resultado);
          if (classifiedResult == 'Alto riesgo') {
            setState(() {
              highRiskTests++;
            });
          } else if (classifiedResult == 'Bajo riesgo') {
            setState(() {
              lowRiskTests++;
            });
          }
        }
      }).toList();

      await Future.wait(fetchResultsFutures);

      setState(() {}); // Refresh UI after updating counts
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _loadResultado(DateTime date) async {
    try {
      List<Resultado> resultadoList =
          await _methodsAuth.getResultadoPorTest(date);
      if (resultadoList.isNotEmpty) {
        return _resultLogic.getClassifiedResult(resultadoList.first.resultado);
      }
      return 'Sin Resultado';
    } catch (e) {
      return 'Error al cargar el resultado';
    }
  }

  Future<void> _deleteTest(DateTime date) async {
    try {
      await _methodsAuth.deleteTestByDateTime(date);
      CustomDialogs.showCorrectDialog(
        context,
        'Mensaje',
        'Se eliminó test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
      );
      setState(() {
        totalTests--;
        dates.remove(date);
        _updateRiskCounts();
      });
    } catch (error) {
      CustomDialogs.showErrorDialog(
        context,
        'Advertencia',
        'No se pudo eliminar test de Hipertensión de la fecha ${DateFormat('dd/MM/yyyy - hh:mm a').format(date)}',
      );
    }
  }

  void _updateRiskCounts() async {
    int updatedHighRiskTests = 0;
    int updatedLowRiskTests = 0;

    for (var date in dates) {
      List<Resultado> resultadoList =
          await _methodsAuth.getResultadoPorTest(date);
      if (resultadoList.isNotEmpty) {
        String classifiedResult =
            _resultLogic.getClassifiedResult(resultadoList.first.resultado);
        if (classifiedResult == 'Alto riesgo') {
          updatedHighRiskTests++;
        } else if (classifiedResult == 'Bajo riesgo') {
          updatedLowRiskTests++;
        }
      }
    }

    setState(() {
      highRiskTests = updatedHighRiskTests;
      lowRiskTests = updatedLowRiskTests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgDark2,
      child: Column(
        children: [
          const TituloTab(titulo: 'Historial de Tests'),
          _buildSummaryRow(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10.0,
                  ),
                  child: FutureBuilder<void>(
                    future: _dataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return _buildTestList();
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

  Widget _buildSummaryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryColumn('Total Tests', totalTests),
          _buildSummaryColumn('Alto Riesgo', highRiskTests),
          _buildSummaryColumn('Bajo Riesgo', lowRiskTests),
        ],
      ),
    );
  }

  Widget _buildSummaryColumn(String label, int count) {
    return Column(
      children: [
        Text(
          '$label: $count',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTestList() {
    if (dates.isNotEmpty) {
      dates.sort((a, b) => b.compareTo(a));
      return Column(
        children: dates.map((date) => _buildTestCard(date)).toList(),
      );
    } else {
      return _buildEmptyState();
    }
  }

  Widget _buildTestCard(DateTime date) {
    return Card(
      color: GlobalColors.bgPanelDark2,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTestCardHeader(date),
            _buildTestCardActions(date),
          ],
        ),
      ),
    );
  }

  Widget _buildTestCardHeader(DateTime date) {
    return Row(
      children: [
        Lottie.asset(
          'assets/animations/heart_test.json',
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('dd/MM/yyyy').format(date),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            Text(
              DateFormat('hh:mm a').format(date),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTestCardActions(DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FutureBuilder<String>(
          future: _loadResultado(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
              return Text(
                snapshot.data ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              );
            }
          },
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: GlobalColors.cardColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetalleTest(date: date),
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
                await _deleteTest(date);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
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
