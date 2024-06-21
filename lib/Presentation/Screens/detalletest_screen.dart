// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Core/Services/methods_firebase.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Domain/Logic/resultlogic.dart';
import '../../Domain/Logic/testlogic.dart';
import '../../Domain/Models/datatest.dart';
import '../../Domain/Models/resultado.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/custom_listdetail.dart';

class DetalleTest extends StatefulWidget {
  final DateTime date;
  const DetalleTest({super.key, required this.date});

  @override
  State<DetalleTest> createState() => _DetalleTestState();
}

class CustomListItemData {
  String title;
  String subtitle;

  CustomListItemData(this.title, this.subtitle);
}

class _DetalleTestState extends State<DetalleTest> {
  final MethodsAuth _methodsAuth = MethodsAuth();
  final TestLogic _testLogic = TestLogic();
  final ResultLogic _resultLogic = ResultLogic();

  List<CustomListItemData> dataList = [];
  String? resultado = "Cargando...";

  @override
  void initState() {
    super.initState();
    _loadDataTest();
    _loadResultado();
  }

  Future<void> _loadDataTest() async {
    try {
      List<Datatest> dataTestList =
          await _methodsAuth.getDataTestByDate(widget.date);
      setState(() {
        dataList = [
          // CustomListItemData('Nombre:', '${dataTestList[0].nombre}'),
          CustomListItemData('Nombre:', dataTestList[0].nombre),
          CustomListItemData(
              '1. Edad:', '${dataTestList[0].edadIngresada} años'),
          CustomListItemData('2. Género seleccionado:',
              _testLogic.getGenderText(dataTestList[0].sexo)),
          CustomListItemData('3. Nivel educativo logrado:',
              _testLogic.getEducationText(dataTestList[0].educacion)),
          CustomListItemData('4. Índice de Masa Corporal - (IMC):',
              '${dataTestList[0].imc} kg/m²'),
          CustomListItemData(
              '5. Cantidad de días en la que ha experimentado estrés, depresión u otros problemas emocionales:',
              'Aproximadamente ${dataTestList[0].saludMental} días'),
          CustomListItemData(
              '6. Actividad física realizada al menos 30 minutos',
              _testLogic.getPhysActivityText(dataTestList[0].actividadFisica)),
          CustomListItemData('7. Consumo de frutas al menos 1 vez al día:',
              _testLogic.getFruitText(dataTestList[0].consumoFrutas)),
          CustomListItemData('8. Consumo de verduras al menos 1 vez al día:',
              _testLogic.getVeggiesText(dataTestList[0].consumoVerduras)),
          CustomListItemData('9. Control o reducción del consumo de sal:',
              _testLogic.getSaltText(dataTestList[0].consumoSal)),
          CustomListItemData('10. Hábito de fumar considerado:',
              _testLogic.getSmokeText(dataTestList[0].consumoCigarros)),
          CustomListItemData(
              '11. Consumo de bebidas alcoholicas en los últimos 30 días:',
              _testLogic.getAlcoholText(dataTestList[0].consumoAlcohol)),
          CustomListItemData(
              '12. Consumo compulsivo de alcohol',
              _testLogic.getCompulsiveAlcoholText(
                  dataTestList[0].consumoAlcCompulsivo)),
          CustomListItemData(
              '13. Niveles altos de colesterol en la sangre según el profesional de salud:',
              _testLogic.getCholesterolText(dataTestList[0].colesterol)),
          CustomListItemData('14. Diagnóstico actual de diabetes:',
              _testLogic.getDiabetesText(dataTestList[0].diabetes)),
          CustomListItemData(
              '15. Ha padecido de un ataque cardiaco o también llamado infarto de miocardio: ',
              _testLogic.getHeartText(dataTestList[0].ataqueCardiaco)),
        ];
      });
    } catch (e) {
      CustomDialogs.showErrorDialog(
        context,
        'Advertencia',
        'Error al cargar los datos del test',
      );
    }
  }

  Future<void> _loadResultado() async {
    try {
      List<Resultado> resultadoList =
          await _methodsAuth.getResultadoPorTest(widget.date);
      setState(() {
        // resultado = _getResultText(resultadoList);
        resultado = _resultLogic.getResultText(resultadoList);
      });
    } catch (e) {
      setState(() {
        resultado = "Error al cargar el resultado";
      });
    }
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
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleSpacing: -8,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 15.0),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.picture_as_pdf),
        //       color: GlobalColors.buttonColor,
        //       iconSize: 30.0,
        //     ),
        //   ),
        // ],
        iconTheme: IconThemeData(
          color: GlobalColors.titlePrimaryColor,
          size: 25.0,
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
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: Colors.white, // Color de fondo del contenedor
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                child: Column(
                  // Envuelve los Text widgets dentro de una Column
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Resultado:',
                      style: TextStyle(
                        color: GlobalColors.bgDark2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        resultado!,
                        style: TextStyle(
                          color: resultado ==
                                  'Bajo riesgo de desarrollar hipertensión arterial'
                              ? Colors.green
                              : resultado == 'Cargando...'
                                  ? GlobalColors.bgPanelDark2
                                  : Colors.red,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
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
