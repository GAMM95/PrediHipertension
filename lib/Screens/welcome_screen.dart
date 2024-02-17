import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../Screens/signin_screen.dart';
import '../Screens/signup_screen.dart';
import '../Theme/global_colors.dart';
import '../Widget/custom_scaffoldwelcome.dart';
import '../Widget/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 1), () {
    //   SystemChrome.setEnabledSystemUIMode(
    //     SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top],
    //   );
    // });
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    return CustomScaffoldWelcome(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(children: [
                      TextSpan(
                          text: '¡Bienvenido de vuelta!\n',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text:
                              '\nVigila tu hipertensión para una vida saludable.',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ]),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(children: [
                const Expanded(
                  child: WelcomeButton(
                    buttonText: 'Iniciar Sesión',
                    onTap: SignInScreen(),
                    color: Colors.transparent,
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: WelcomeButton(
                    buttonText: 'Regístrate',
                    onTap: const SignUpScreen(),
                    color: Colors.white,
                    textColor: GlobalColors.welcomeText,
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
