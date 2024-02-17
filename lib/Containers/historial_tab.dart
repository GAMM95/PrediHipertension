import 'package:flutter/material.dart';
import '../Theme/global_colors.dart';
import '../Components/custom_card.dart';
import '../Utilities/detalle_test.dart';

class HistorialTab extends StatefulWidget {
  const HistorialTab({super.key});

  @override
  State<HistorialTab> createState() => _HistorialTabState();
}

class _HistorialTabState extends State<HistorialTab> {
  TextEditingController edadController = TextEditingController();
  TextEditingController imcController = TextEditingController();

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
                    title: 'Fecha de test',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text('Fecha Test'),
                            ),
                            IconButton(
                              onPressed: _mostrarDetalleTest,
                              icon: Icon(
                                Icons.info_outline,
                                color: GlobalColors.hintText,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  void _mostrarDetalleTest() {
    DetalleTest.mostrarDetalle(context, imcController);
  }
}
