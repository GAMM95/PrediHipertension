// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:predihipertension/Core/Theme/global_colors.dart';
// import 'package:predihipertension/Domain/Logic/resultlogic.dart';
// import 'package:predihipertension/Domain/Models/resultado.dart';
// import 'package:predihipertension/Presentation/Utilities/custom_dialogs.dart';
// import 'package:predihipertension/Domain/Logic/testlogic.dart';
// import 'package:predihipertension/Presentation/Widget/custom_listDetail.dart';
// import 'package:predihipertension/Core/Services/methods_firebase.dart';
// import 'package:predihipertension/Domain/Models/datatest.dart';

// class DetalleTest extends StatefulWidget {
//   final DateTime date;
//   const DetalleTest({super.key, required this.date});

//   @override
//   State<DetalleTest> createState() => _DetalleTestState();
// }

// class CustomListItemData {
//   final String title;
//   final String subtitle;

//   CustomListItemData(this.title, this.subtitle);
// }

// class _DetalleTestState extends State<DetalleTest> {
//   final MethodsAuth _methodsAuth = MethodsAuth();
//   final TestLogic _testLogic = TestLogic(); // Instancia de ResultLogic

//   List<CustomListItemData> dataList = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadDataTest();
//   }

//   Future<void> _loadDataTest() async {
//     try {
//       List<Datatest> dataTestList =
//           await _methodsAuth.getDataTestByDate(widget.date);
//       setState(() {
//         dataList = [
//           CustomListItemData(
//               '1. Edad:', '${dataTestList[0].edadIngresada} años'),
//           CustomListItemData(
//               '2. Género:', _testLogic.getGenderText(dataTestList[0].sexo)),
//           CustomListItemData(
//               '3. Índice de Masa Corporal - (IMC):', '${dataTestList[0].imc}'),
//           CustomListItemData('4. Estado de salud percibida:',
//               _testLogic.getGeneralHealth(dataTestList[0].saludGeneral)),
//           CustomListItemData(
//               '5. Cantidad de días en la que considera su estado de salud mental no fue tan buena:',
//               '${dataTestList[0].saludMental} días'),
//           CustomListItemData(
//               '6. Cantidad de días en la que considera su estado de salud física no fue tan buena:',
//               '${dataTestList[0].saludFisica} días'),
//           CustomListItemData(
//               '7. Presenta dificultades graves para caminar o subir escaleras:',
//               _testLogic.getDiffWalkText(dataTestList[0].dificultadCaminar)),
//           CustomListItemData('8. Consumo de frutas al menos 1 vez al día:',
//               _testLogic.getFruitText(dataTestList[0].consumoFrutas)),
//           CustomListItemData('9. Consumo de verduras al menos 1 vez al día:',
//               _testLogic.getVeggiesText(dataTestList[0].consumoVerduras)),
//           CustomListItemData(
//               '10. Consumo de al menos 100 cigarrillos en su vida:',
//               _testLogic.getSmokeText(dataTestList[0].consumoCigarros)),
//           CustomListItemData('11. Consumo de alcohol muy frecuente:',
//               _testLogic.getAlcoholText(dataTestList[0].consumoAlcohol)),
//           CustomListItemData(
//               '12. Ha realizado actividad física durante los últimos 30 días:',
//               _testLogic.getPhysActivityText(dataTestList[0].actividadFisica)),
//           CustomListItemData(
//               '13. Colesterol alto en la sangre según el profesional de salud:',
//               _testLogic.getCholesterolText(dataTestList[0].colesterol)),
//           CustomListItemData(
//               '14. Ha realizado un control de colesterol en los últimos 5 años:',
//               _testLogic.getCheckCholText(dataTestList[0].chequeoColesterol)),
//           CustomListItemData('15. Estado actual de diabetes:',
//               _testLogic.getDiabetesText(dataTestList[0].diabetes)),
//           CustomListItemData(
//               '16. Ha presentado un accidente cerebrovascular (acv):',
//               _testLogic.getAcvText(dataTestList[0].acv)),
//           CustomListItemData(
//               '17. Ha presentado una enfermedad coronaria o infarto de miocardio:',
//               _testLogic.getHeartText(dataTestList[0].enfermedadCardiaca)),
//         ];
//       });
//     } catch (e) {
//       CustomDialogs.showErrorDialog(
//         context,
//         'Advertencia',
//         'Error al cargar los datos del test',
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GlobalColors.bgPanelDark,
//       appBar: AppBar(
//         title: Text(
//           'Detalle del Test',
//           style: TextStyle(
//             color: GlobalColors.titlePrimaryColor,
//             fontSize: 22.0,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         titleSpacing: -8,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.picture_as_pdf),
//               color: GlobalColors.buttonColor,
//               iconSize: 30.0,
//             ),
//           ),
//         ],
//         iconTheme: IconThemeData(
//           color: GlobalColors.titlePrimaryColor,
//           size: 25.0,
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Text(
//               'Test fecha \n${DateFormat('dd/MM/yyyy - hh:mm a').format(widget.date)}',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: GlobalColors.cardColor,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
//               child: Container(
//                 color: Colors.white, // Color de fondo del contenedor
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Aqui ira el resultado',
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 209, 119, 119),
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: GlobalColors.cardColor,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: dataList.isEmpty
//                         ? const Center(child: CircularProgressIndicator())
//                         : ListView.builder(
//                             itemCount: dataList.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 child: CustomListItem(
//                                   title: dataList[index].title,
//                                   subtitle: dataList[index].subtitle,
//                                 ),
//                               );
//                             },
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Utilities/custom_dialogs.dart';
import 'package:predihipertension/Domain/Logic/testlogic.dart';
import 'package:predihipertension/Presentation/Widget/custom_listDetail.dart';
import 'package:predihipertension/Core/Services/methods_firebase.dart';
import 'package:predihipertension/Domain/Models/datatest.dart';

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
  final TestLogic _testLogic = TestLogic(); // Instancia de ResultLogic

  List<CustomListItemData> dataList = [];
  String? resultadoPrediccion;

  @override
  void initState() {
    super.initState();
    _loadDataTest();
    // _loadResultadoPrediccion();
  }

  Future<void> _loadDataTest() async {
    try {
      List<Datatest> dataTestList =
          await _methodsAuth.getDataTestByDate(widget.date);
      setState(() {
        dataList = [
          CustomListItemData(
              '1. Edad:', '${dataTestList[0].edadIngresada} años'),
          CustomListItemData(
              '2. Género:', _testLogic.getGenderText(dataTestList[0].sexo)),
          CustomListItemData(
              '3. Índice de Masa Corporal - (IMC):', '${dataTestList[0].imc}'),
          CustomListItemData('4. Estado de salud percibida:',
              _testLogic.getGeneralHealth(dataTestList[0].saludGeneral)),
          CustomListItemData(
              '5. Cantidad de días en la que considera su estado de salud mental no fue tan buena:',
              '${dataTestList[0].saludMental} días'),
          CustomListItemData(
              '6. Cantidad de días en la que considera su estado de salud física no fue tan buena:',
              '${dataTestList[0].saludFisica} días'),
          CustomListItemData(
              '7. Presenta dificultades graves para caminar o subir escaleras:',
              _testLogic.getDiffWalkText(dataTestList[0].dificultadCaminar)),
          CustomListItemData('8. Consumo de frutas al menos 1 vez al día:',
              _testLogic.getFruitText(dataTestList[0].consumoFrutas)),
          CustomListItemData('9. Consumo de verduras al menos 1 vez al día:',
              _testLogic.getVeggiesText(dataTestList[0].consumoVerduras)),
          CustomListItemData(
              '10. Consumo de al menos 100 cigarrillos en su vida:',
              _testLogic.getSmokeText(dataTestList[0].consumoCigarros)),
          CustomListItemData('11. Consumo de alcohol muy frecuente:',
              _testLogic.getAlcoholText(dataTestList[0].consumoAlcohol)),
          CustomListItemData(
              '12. Ha realizado actividad física durante los últimos 30 días:',
              _testLogic.getPhysActivityText(dataTestList[0].actividadFisica)),
          CustomListItemData(
              '13. Colesterol alto en la sangre según el profesional de salud:',
              _testLogic.getCholesterolText(dataTestList[0].colesterol)),
          CustomListItemData(
              '14. Ha realizado un control de colesterol en los últimos 5 años:',
              _testLogic.getCheckCholText(dataTestList[0].chequeoColesterol)),
          CustomListItemData('15. Estado actual de diabetes:',
              _testLogic.getDiabetesText(dataTestList[0].diabetes)),
          CustomListItemData(
              '16. Ha presentado un accidente cerebrovascular (acv):',
              _testLogic.getAcvText(dataTestList[0].acv)),
          CustomListItemData(
              '17. Ha presentado una enfermedad coronaria o infarto de miocardio:',
              _testLogic.getHeartText(dataTestList[0].enfermedadCardiaca)),
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

  // Future<void> _loadResultadoPrediccion() async {
  //   try {
  //     final resultado = await _methodsAuth.obtenerResultadoPrediccion();
  //     setState(() {
  //       resultadoPrediccion = resultado;
  //     });
  //   } catch (e) {
  //     CustomDialogs.showErrorDialog(
  //       context,
  //       'Advertencia',
  //       'Error al cargar el resultado de la predicción',
  //     );
  //   }
  // }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.picture_as_pdf),
              color: GlobalColors.buttonColor,
              iconSize: 30.0,
            ),
          ),
        ],
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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  resultadoPrediccion ?? 'Aqui ira el resultado',
                  // Aquí se muestra el resultado de la predicción si está disponible,
                  // de lo contrario, muestra el texto predeterminado
                  style: const TextStyle(
                    color: Color.fromARGB(255, 209, 119, 119),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
