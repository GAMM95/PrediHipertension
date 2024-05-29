import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../Utilities/custom_dialogs.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final imcController = TextEditingController();

  CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Colors.black,
      overlayOpacity: 0.3,
      spacing: 8,
      spaceBetweenChildren: 8,
      // closeManually: true,
      children: [
        /// Primer icono flotante
        SpeedDialChild(
          child: const Icon(Icons.help),
          label: 'Acerca de',
          onTap: () {
            Navigator.of(context).pushNamed('/acercade');
          },
        ),

        /// Segundo icono flotante
        SpeedDialChild(
          child: const Icon(Icons.calculate_rounded),
          label: 'Calculadora de IMC',
          onTap: () {
            Navigator.of(context).pushNamed('/calcimc');
          },
        ),

        /// Tercer icono flotante
        SpeedDialChild(
          child: const Icon(Icons.logout),
          label: 'Cerrar sesión',
          onTap: () {
            CustomDialogs.cerrarSesion(context);
          },
        ),
      ],
    );
  }
}
