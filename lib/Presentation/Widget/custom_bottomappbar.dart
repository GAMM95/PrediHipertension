import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: GlobalColors.bgColor,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Desarrollado por: \nGAMM95',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColors.bgPanelDark2,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
