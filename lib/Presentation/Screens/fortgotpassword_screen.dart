// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Core/Services/firebase_auth.dart';
import '../../Core/Theme/global_colors.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/custom_textfield.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService _authService = AuthService();

  final _emailController = TextEditingController();

  final _formResetPassKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _clearInputs() {
    _emailController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgDark1,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: GlobalColors.bgPanelDark,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/forgot.json',
                  width: 150,
                  height: 150,
                ),
                Text(
                  "¿Olvidaste tu contraseña?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GlobalColors.titlePanel,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  "¡No te preocupes! Proporciona tu correo electrónico y te ayudaremos a recuperar el acceso.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25.0),
                Form(
                  key: _formResetPassKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Ingrese su correo electrónico',
                        enabled: true,
                        label: const Text('Correo electrónico'),
                        validator: 'Ingrese su correo electrónico',
                        controller: _emailController,
                      ),

                      const SizedBox(height: 25.0), // Espacio

                      /// Boton Enviar
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formResetPassKey.currentState!.validate()) {
                              try {
                                await _authService.resetPassword(
                                  email: _emailController.text.trim(),
                                );

                                // Agregar mensaje de éxito
                                CustomDialogs.showCorrectDialog(
                                    context,
                                    'Mensaje',
                                    'Se envió un mensaje a su correo. Verifique su bandeja de entrada.');
                                _clearInputs();
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'invalid-email') {
                                  CustomDialogs.showErrorDialog(
                                      context,
                                      'Ocurrió un problema:',
                                      'Formato de correo electrónico inválido.');
                                } else {
                                  CustomDialogs.showErrorDialog(context,
                                      'Ocurrió un problema:', '${e.message}');
                                }
                              } catch (error) {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Error inesperado durante el restablecimiento de la contraseña:',
                                  '$error',
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Enviar',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Quieres iniciar sesión? ',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 13.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child: Text(
                        'Regresar',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: GlobalColors.linkText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
