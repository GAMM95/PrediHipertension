// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Core/Services/firebase_auth.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Core/Theme/theme.dart';
import '../../Domain/Models/usuario.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/custom_button.dart';
import '../Widget/custom_passwordfield.dart';
import '../Widget/custom_textfield.dart';
import '../Widget/inputfieldheader.dart';
import 'signin_screen.dart';
import 'welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();

  final _nombreController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formSignupKey = GlobalKey<FormState>();
  bool agreeTercon = false;
  bool agreeDataAuth = false;
  bool emailVerificationSent = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidosController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _clearInputs() {
    _nombreController.clear();
    _apellidosController.clear();
    _emailController.clear();
    _passwordController.clear();
    agreeTercon = false;
    agreeDataAuth = false;
    FocusScope.of(context).unfocus();

    // Restablecer los validadores del formulario
    _formSignupKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GlobalColors.bgPanelDark,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: InputFieldsHeader(
                title: 'Únete a PrediHipertension',
                onBackPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formSignupKey,
                  child: ListView(
                    children: [
                      /// Input Nombre completo
                      CustomTextField(
                        controller: _nombreController,
                        textInputType: TextInputType.text,
                        applyTextCapitalization: true,
                        showNextButton: true,
                        hintText: 'Ingrese sus nombres',
                        label: const Text('Nombres'),
                        enabled: true,
                        validator: 'Ingrese sus nombres',
                      ),

                      const SizedBox(height: 15.0), // Espacio

                      /// Input Apellidos
                      CustomTextField(
                        controller: _apellidosController,
                        textInputType: TextInputType.name,
                        applyTextCapitalization: true,
                        showNextButton: true,
                        hintText: 'Ingrese sus apellidos',
                        label: const Text('Apellidos'),
                        enabled: true,
                        validator: 'Ingrese sus apellidos',
                      ),

                      const SizedBox(height: 15.0), // Espacio
                      /// Input Correo electrónico
                      CustomTextField(
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        showNextButton: true,
                        hintText: 'Ingrese su correo electrónico',
                        label: const Text('Correo electrónico'),
                        enabled: true,
                        validator: 'Ingrese su correo electrónico',
                      ),

                      const SizedBox(height: 15.0), // Espacio

                      /// Input Contraseña
                      CustomPasswordTextField(
                        controller: _passwordController,
                        hintText: 'Ingrese su contraseña',
                        label: const Text('Contraseña'),
                        validator: 'Ingrese su contraseña',
                      ),

                      const SizedBox(height: 10.0), // Espacio

                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreeTercon,
                            onChanged: (bool? value) {
                              setState(() {
                                agreeTercon = value!;
                              });
                            },
                            activeColor: GlobalColors.buttonColor,
                            side:
                                BorderSide(color: GlobalColors.borderTextField),
                            // activeColor: lightColorScheme.primary,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/tercon');
                            },
                            child: Text(
                              'Términos y condiciones de uso ',
                              style: TextStyle(
                                color: lightColorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: agreeDataAuth,
                            onChanged: (bool? value) {
                              setState(() {
                                agreeDataAuth = value!;
                              });
                            },
                            activeColor: GlobalColors.buttonColor,
                            side:
                                BorderSide(color: GlobalColors.borderTextField),
                            // activeColor: lightColorScheme.primary,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/dataauth');
                            },
                            child: Text(
                              'Autorización de uso de datos personales',
                              style: TextStyle(
                                color: lightColorScheme.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0), // Espacio

                      /// Boton Unirse
                      CustomButton(
                        texto: 'Unirse',
                        onPressed: () async {
                          if (_formSignupKey.currentState!.validate() &&
                              agreeTercon &&
                              agreeDataAuth) {
                            // Validar longitud de la contraseña
                            if (_passwordController.text.trim().length < 6) {
                              CustomDialogs.showErrorDialog(
                                context,
                                'Advertencia',
                                'La contraseña debe tener al menos 6 caracteres.',
                              );
                              return;
                            }
                            try {
                              // Mostrar el círculo de progreso
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );

                              bool signUpSuccess = await _authService.signUp(
                                usuario: Usuario(
                                  firstName: _nombreController.text.trim(),
                                  lastName: _apellidosController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );

                              // Retrasar la desaparición del círculo de progreso por 4 segundos
                              await Future.delayed(const Duration(seconds: 4));

                              // Desaparecer el círculo de progreso
                              Navigator.pop(context);

                              if (signUpSuccess) {
                                // Mostrar cuadro de diálogo de éxito
                                CustomDialogs.showCorrectDialog(
                                  context,
                                  'Bienvenido a PrediHipertension ${_nombreController.text.trim()}',
                                  "Se ha enviado un correo electrónico de verificación. Por favor, compruebe su bandeja de entrada al correo ${_emailController.text.trim()}",
                                );
                              } else {
                                // Mostrar cuadro de diálogo de error
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  'Este correo electrónico ya está registrado.',
                                );
                              }
                              _clearInputs(); // Limpiar cajas de texto
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'email-already-in-use') {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  'Este correo electrónico ya está registrado.',
                                );
                              } else if (e.code == 'invalid-email') {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  'Formato de correo electrónico inválido.',
                                );
                              } else if (e.code == 'weak-password') {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  'Su contraseña debe tener al menos 6 caracteres.',
                                );
                              } else {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  '${e.message}',
                                );
                              }
                            }
                          } else if (!agreeTercon) {
                            CustomDialogs.showErrorDialog(
                              context,
                              'Advertencia',
                              'Acepte términos y condiciones de uso.',
                            );
                          } else if (!agreeDataAuth) {
                            CustomDialogs.showCorrectDialog(
                              context,
                              'Advertencia',
                              'Acepte autorización para el tratamiento de datos personales',
                            );
                          }
                        },
                        isEnabled: true,
                      ),

                      const SizedBox(height: 25.0), // Espacio

                      // Ya tienes una cuenta
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Ya tienes una cuenta? ',
                            style: TextStyle(
                              color: GlobalColors.textColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const SignInScreen();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(0.0, 1.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                ),
                              );
                            },
                            child: Text(
                              'Inicia sesión',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0), // Espacio
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
