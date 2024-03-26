import 'package:flutter/material.dart';
import 'package:predihipertension/Presentation/Widget/calculadora_imc.dart';

import '../../Presentation/Screens/dataauthorization_screen.dart';
import '../../Presentation/Screens/fortgotpassword_screen.dart';
import '../../Presentation/Screens/home_screen.dart';
import '../../Presentation/Screens/signin_screen.dart';
import '../../Presentation/Screens/signup_screen.dart';
import '../../Presentation/Screens/tercon_screen.dart';
import '../../Presentation/Screens/welcome_screen.dart';
import 'package:predihipertension/Presentation/Screens/acercade_screen.dart';

class RoutesScreens {
  static const String welcome = '/welcome';
  static const String forgot = '/forgot';
  static const String dataauth = '/dataauth';
  static const String tercon = '/tercon';
  static const String ayuda = '/acercade';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String principal = '/principal';
  static const String detalletest = '/detalletest';
  static const String calcimc = '/calcimc';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      welcome: (context) => const WelcomeScreen(),
      forgot: (context) => const ForgotPasswordScreen(),
      dataauth: (context) => const DataAuthScreen(),
      tercon: (context) => const TerminosCondicionesScreen(),
      ayuda: (context) => const AcercaDeScreen(),
      signin: (context) => const SignInScreen(),
      signup: (context) => const SignUpScreen(),
      principal: (context) => const HomeScreen(),
      calcimc: (context) => const CalculadoraIMC(),
    };
  }
}
