import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';

class TituloTab extends StatelessWidget {
  final String titulo;
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
