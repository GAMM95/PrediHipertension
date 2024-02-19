import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Theme/theme.dart';
import '../Routes/routes_screens.dart';
import '../Screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //   //     overlays: [SystemUiOverlay.top]);
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      //     overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      //   //     overlays: [SystemUiOverlay.bottom]);

      //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
      //   //     overlays: [SystemUiOverlay.top]);
    });

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Color.fromARGB(0, 217, 192, 192),
      systemNavigationBarIconBrightness: Brightness.light,
    ));

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
