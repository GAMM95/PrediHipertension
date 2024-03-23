import 'package:flutter/material.dart';
// import 'package:predihipertension/Screens/detalletest_screen.dart';

import '../Screens/dataauthorization_screen.dart';
import '../Screens/fortgotpassword_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/signin_screen.dart';
import '../Screens/signup_screen.dart';
import '../Screens/tercon_screen.dart';
import '../Screens/welcome_screen.dart';
import 'package:predihipertension/Screens/ayuda_screen.dart';

class RoutesScreens {
  static const String welcome = '/welcome';
  static const String forgot = '/forgot';
  static const String dataauth = '/dataauth';
  static const String tercon = '/tercon';
  static const String ayuda = '/ayuda';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String principal = '/principal';
  static const String detalletest = '/detalletest';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      welcome: (context) => const WelcomeScreen(),
      forgot: (context) => const ForgotPasswordScreen(),
      dataauth: (context) => const DataAuthScreen(),
      tercon: (context) => const TerminosCondicionesScreen(),
      ayuda: (context) => const AyudaScreen(),
      signin: (context) => const SignInScreen(),
      signup: (context) => const SignUpScreen(),
      principal: (context) => const HomeScreen(),
      // detalletest: (context) => const DetalleTest(date: DateTime),
    };
  }
}
