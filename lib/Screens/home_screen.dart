import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/custom_floatingbutton.dart';
import '../Routes/routes_pages.dart';
import '../Services/methods_auth.dart';
import '../Theme/global_colors.dart';
import '../Utilities/saludo.dart';
import '../Widget/custom_bottomnavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MethodsAuth _methodsAuth = MethodsAuth();

  int index = 0;
  CustomNavBar? myCNB;

  late String _saludo;
  late String _nombreUsuario = '';

  @override
  void initState() {
    super.initState();
    _setSaludo();
    _setNombreUsuario();
    myCNB = CustomNavBar(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
  }

  void _setSaludo() {
    _saludo = Saludo.saludarUsuario();
  }

  void _setNombreUsuario() async {
    try {
      // Obtener el primer nombre del usuario usando el ID
      String? firstName = await _methodsAuth.getFirstName();
      setState(() {
        _nombreUsuario = firstName ?? '';
      });
    } catch (error) {
      setState(() {
        _nombreUsuario = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cambiar el color de la barra de estado y el estilo del texto
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white, // Color transparente
      statusBarIconBrightness: Brightness.dark, // Iconos en blanco
    ));

    return Scaffold(
      bottomNavigationBar: myCNB,
      body: RoutesPages(index: index),
      appBar: AppBar(
        title: Text(
          '$_saludo $_nombreUsuario',
          style: TextStyle(color: GlobalColors.saludoText),
        ),
        centerTitle: false,
        elevation: 4,
        shadowColor: Colors.black26,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                GlobalColors.headerColor1,
                GlobalColors.headerColor1,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
