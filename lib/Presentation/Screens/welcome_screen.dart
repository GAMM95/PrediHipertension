import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Presentation/Widget/custom_scaffoldwelcome.dart';
import 'package:predihipertension/Presentation/Widget/welcome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWelcome(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 4,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                      text: '¡Bienvenido de vuelta!\n',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '\nVigila tu hipertensión para una vida saludable.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Iniciar Sesión',
                      onTap: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Regístrate',
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      color: Colors.white,
                      textColor: GlobalColors.welcomeText,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
