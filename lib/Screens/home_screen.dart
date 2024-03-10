import 'package:flutter/material.dart';
import 'package:predihipertension/Theme/theme.dart';

import 'package:predihipertension/Components/custom_floatingbutton.dart';
import 'package:predihipertension/Routes/routes_pages.dart';
import 'package:predihipertension/Services/methods_auth.dart';
import 'package:predihipertension/Theme/global_colors.dart';
import 'package:predihipertension/Utilities/saludo.dart';
import 'package:predihipertension/Widget/custom_bottomnavbar.dart';

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
    return Scaffold(
      bottomNavigationBar: myCNB,
      body: RoutesPages(index: index),
      appBar: AppBar(
        title: Text(
          '$_saludo $_nombreUsuario',
          style: TextStyle(
            color: lightColorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        elevation: 4,
        shadowColor: Colors.black26,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                GlobalColors.appBarColor,
                GlobalColors.appBarColor,
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
