import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

class AcercaDeScreen extends StatefulWidget {
  const AcercaDeScreen({super.key});

  @override
  State<AcercaDeScreen> createState() => _AcercaDeScreenState();
}

class _AcercaDeScreenState extends State<AcercaDeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tercon');
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Términos y condiciones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: GlobalColors.bgDark1,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            GestureDetector(
              onTap: () {
                // Acción para el segundo GestureDetector
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Segundo Texto',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: GlobalColors.bgDark1,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
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
                          color: GlobalColors.bgPanelDark2,
                        ),
                      ),
                    ),
                    Text(
                      '1.0.0',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: GlobalColors.bgPanelDark2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(5.0),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
