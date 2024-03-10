import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:predihipertension/Screens/welcome_screen.dart';
import 'package:predihipertension/Theme/global_colors.dart';

/// Widget para mostrar una pantalla de splash animada al iniciar la aplicación.
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      /// Widget de animación de splash con una columna que contiene la animación de Lottie.
      splash: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/animations/splash_heart.json',
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),

      /// Tamaño del icono de splash.
      splashIconSize: 200,

      /// Tipo de transición de la animación de splash.
      splashTransition: SplashTransition.scaleTransition,

      /// Color de fondo de la pantalla de splash.
      backgroundColor: GlobalColors.splashColor,

      /// Duración total de la animación de splash.
      duration: 2000,

      /// Tipo de transición a la siguiente pantalla después de la animación de splash.
      pageTransitionType: PageTransitionType.bottomToTop,

      /// Duración de la animación de transición a la siguiente pantalla.
      animationDuration: const Duration(seconds: 2),

      /// Widget de la siguiente pantalla después de la animación de splash.
      nextScreen: const WelcomeScreen(),
      // nextScreen: const SignInScreen(),
      // nextScreen: const InitialPage(),
      // nextScreen: const Welcome(),
      // nextScreen: const SignUpScreen(),
    );
  }
}
// "https://lottie.host/df45e55c-0afe-49be-94a0-f4137338ac28/xsfOQXYygZ.json",
// "https://lottie.host/6445052e-42ff-4d3a-a5fd-17c61ca7a9b9/TT27VA7ZFP.json",
// "https://lottie.host/a980d0f0-5119-4d93-bb5a-542c8a946683/6IQXjbhAcv.json",
// "https://lottie.host/ad4e213b-17b8-4216-b55d-9c7c66a7e8ef/WGH1yqs3oz.json"