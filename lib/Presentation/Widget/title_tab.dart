import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

/// Widget reutilizable para mostrar un título en una pestaña.
class TituloTab extends StatelessWidget {
  /// El título que se mostrará en la pestaña.
  final String titulo;

  /// Constructor para crear un título de pestaña.
  const TituloTab({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.bgPanelDark2,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: GlobalColors.titlePanel,
          ),
        ),
      ),
    );
  }
}
