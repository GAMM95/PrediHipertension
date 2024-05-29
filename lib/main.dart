import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Core/Routes/routes_screens.dart';
import 'Core/Theme/theme.dart';
import 'Presentation/Screens/splash_screen.dart';
import 'firebase_options.dart';

/// Método principal de la aplicación.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con las opciones por defecto según la plataforma actual.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

/// Aplicación principal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporizador para ocultar la barra de estado después de 5 segundos.
    Timer(const Duration(seconds: 5), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ]);
    });

    // Configura el estilo de la barra de estado y la barra de navegación del sistema.
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Color.fromARGB(0, 217, 192, 192),
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    // Configura las orientaciones preferidas de la pantalla.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hipertension App',
      routes: RoutesScreens.getRoutes(),
      theme: lightMode,
      home: const Splash(),
    );
  }
}
