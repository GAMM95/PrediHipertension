import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Widget/custom_bottomappbar.dart';
import 'package:predihipertension/Presentation/Widget/custom_gesturedetector.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgPanelDark2,
      appBar: AppBar(
        backgroundColor: GlobalColors.bgColor,
        title: Text(
          'Acerca de',
          style: TextStyle(
            color: GlobalColors.titlePrimaryColor,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleSpacing: -8,
        iconTheme: IconThemeData(
          color: GlobalColors.titlePrimaryColor,
          size: 25.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            const CustomGestureDetector(
              text: 'Términos y condiciones de uso',
              routeName: '/tercon',
              showDivider: true,
            ),
            const CustomGestureDetector(
              text: 'Autorización para el tratamiento de datos personales',
              routeName: '/dataauth',
              showDivider: true,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Versión del software',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: GlobalColors.hintText,
                        ),
                      ),
                    ),
                    Text(
                      'v1.0.0',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: GlobalColors.hintText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
