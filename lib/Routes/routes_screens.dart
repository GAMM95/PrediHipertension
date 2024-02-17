import 'package:flutter/material.dart';

import '../Screens/fortgotpassword_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/signin_screen.dart';
import '../Screens/signup_screen.dart';
import '../Screens/tercon_screen.dart';
import '../Screens/welcome_screen.dart';


class RoutesScreens {
  static const String welcome = '/welcome';
  static const String forgot = '/forgot';
  static const String tercon = '/tercon';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String principal = '/principal';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      welcome: (context) => const WelcomeScreen(),
      forgot: (context) => const ForgotPasswordScreen(),
      tercon: (context) => const TerminosCondicionesScreen(),
      signin: (context) => const SignInScreen(),
      signup: (context) => const SignUpScreen(),
      principal: (context) => const HomeScreen(),
    };
  }
}
