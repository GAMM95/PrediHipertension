// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Widget/custom_listDetail.dart';
import 'package:predihipertension/Services/methods_auth.dart';
import '../Models/datatest.dart';

class DetalleTest extends StatefulWidget {
  final DateTime date;
  const DetalleTest({super.key, required this.date});

  @override
  State<DetalleTest> createState() => _DetalleTestState();
}

class CustomListItemData {
  final String title;
  final String subtitle;

  CustomListItemData(this.title, this.subtitle);
}

class _DetalleTestState extends State<DetalleTest> {
  final MethodsAuth _methodsAuth = MethodsAuth();
  List<CustomListItemData> dataList = [];

  @override
  void initState() {
    super.initState();
    _loadDataTest();
  }

  Future<void> _loadDataTest() async {
    try {
      List<Datatest> dataTestList =
          await _methodsAuth.getDataTestByDate(widget.date);
      setState(() {
        dataList = [
          CustomListItemData('Edad', '${dataTestList[0].age}'),
          CustomListItemData('Género', _getGenderText(dataTestList[0].genere)),
          CustomListItemData(
              'Índice de Masa Corporal - (IMC)', '${dataTestList[0].imc}'),
        ];
      });
    } catch (e) {
      CustomDialogs.showErrorDialog(
        context,
        'Error',
        'Error al cargar los datos del test',
      );
    }
  }

  String _getGenderText(int gender) {
    return gender == 0 ? 'Masculino' : 'Femenino';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgPanelDark,
      appBar: AppBar(
        title: Text(
          'Detalle del Test',
          style: TextStyle(
            color: GlobalColors.titlePrimaryColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleSpacing: -8, //
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                // Acción para el ícono del PDF
              },
              icon: const Icon(Icons.picture_as_pdf),
              color: GlobalColors.buttonColor,
              iconSize: 30.0,
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: GlobalColors.titlePrimaryColor,
          size: 30.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Test fecha \n${DateFormat('dd/MM/yyyy - hh:mm a').format(widget.date)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: GlobalColors.cardColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: GlobalColors.cardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: dataList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: CustomListItem(
                                  title: dataList[index].title,
                                  subtitle: dataList[index].subtitle,
                                ),
                              );
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
