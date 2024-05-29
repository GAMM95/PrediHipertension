// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Core/Services/firebase_auth.dart';
import '../../Core/Theme/global_colors.dart';
import '../../Core/Theme/theme.dart';
import '../Utilities/custom_dialogs.dart';
import '../Widget/custom_button.dart';
import '../Widget/custom_clipper.dart';
import '../Widget/custom_divider.dart';
import '../Widget/custom_passwordfield.dart';
import '../Widget/custom_textfield.dart';
import '../Widget/social_icon.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formSignKey = GlobalKey<FormState>();
  bool rememberPassword = false;

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
              child: _buildInputFields(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formSignKey,
                  child: ListView(
                    children: [
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

                      const SizedBox(height: 20.0), // Espacio

                      /// Input Contraseña
                      CustomPasswordTextField(
                        controller: _passwordController,
                        hintText: 'Ingrese su contraseña',
                        label: const Text('Contraseña'),
                        validator: 'Ingrese su contraseña',
                      ),

                      const SizedBox(height: 25.0), // Espacio

                      /// Boton Continuar - Iniciar Sesión
                      CustomButton(
                        texto: 'Continuar',
                        onPressed: () async {
                          if (_formSignKey.currentState!.validate()) {
                            try {
                              // Mostrar el círculo de progreso
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              bool isSignInSuccessful =
                                  await _authService.signIn(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                              // Retrasar la navegación a la pantalla principal por 2 segundos
                              await Future.delayed(const Duration(seconds: 2));

                              // Ocultar el diálogo de progreso
                              Navigator.of(context).pop();
                              if (isSignInSuccessful) {
                                // Verificar si el correo electrónico está verificado
                                if (!_authService.currentUser!.emailVerified) {
                                  CustomDialogs.showErrorDialog(
                                    context,
                                    'Correo electrónico no verificado',
                                    'Por favor, revise su bandeja de entrada de su correo electrónico registrado antes de continuar.',
                                  );
                                } else {
                                  // Iniciar sesión correctamente
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  );
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/principal',
                                    (route) => false,
                                  );
                                }
                              } else {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Credenciales incorrectas',
                                  'Verifique su email y/o contraseña',
                                );
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code != 'user-not-found') {
                                CustomDialogs.showErrorDialog(
                                  context,
                                  'Ocurrió un problema:',
                                  'Usuario no encontrado. Regístrese antes de iniciar sesión.',
                                );
                              } else if (e.code == 'invalid-email') {
                                CustomDialogs.showErrorDialog(
                                    context,
                                    'Ocurrió un problema:',
                                    'Formato de correo electrónico inválido.');
                              } else {
                                CustomDialogs.showErrorDialog(context,
                                    'Ocurrió un problema:', '${e.message}');
                              }
                            } catch (error) {
                              Navigator.of(context).pop();
                              CustomDialogs.showErrorDialog(
                                context,
                                'Error inesperado:',
                                '$error',
                              );
                            }
                          }
                        },
                        isEnabled: true,
                      ),

                      const SizedBox(height: 15.0), // Espacio

                      /// CheckBox y Has olvidado Contraseña
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// CheckBox Recordarme
                          // Row(
                          //   children: [
                          //     Checkbox(
                          //       value: rememberPassword,
                          //       onChanged: (bool? value) {
                          //         setState(() {
                          //           rememberPassword = value!;
                          //         });
                          //       },
                          //       // activeColor: lightColorScheme.primary,
                          //       activeColor: GlobalColors.buttonColor,
                          //       side: BorderSide(
                          //           color: GlobalColors.borderTextField),
                          //     ),
                          //     Text(
                          //       'Recuérdame',
                          //       style: TextStyle(
                          //         color: GlobalColors.textColor,
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          /// Pregunta - ¿Has olvidado tu contraseña?
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/forgot');
                            },
                            child: Text(
                              '¿Has olvidado tu contraseña?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: lightColorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0), // Espacio

                      /// Divisor [ --- o--- ]
                      const CustomDivider(),

                      const SizedBox(height: 20.0), // Espacio

                      /// Botones Sociales
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Continuar con Google
                          SocialIcons(
                            ruta: "assets/icons/google.svg",
                            texto: 'Continuar con Google',
                            onPressed: () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              try {
                                User? user =
                                    await _authService.signInWithGoogle();
                                if (user != null) {
                                  // Iniciar sesión exitosa con Google
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/principal',
                                    (route) => false,
                                  );
                                } else {
                                  // Ocurrió un error durante el inicio de sesión con Google
                                  Navigator.pop(context);
                                }
                              } catch (error) {
                                // Manejar errores durante el inicio de sesión con Google
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 15.0), // Espacio

                      // No tienes una cuenta
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿No tiene una cuenta? ',
                            style: TextStyle(
                              color: GlobalColors.textColor,
                            ),
                          ),

                          // Texto Regístrese
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.of(context).pushNamed('/signup');
                          //   },
                          //   child: Text(
                          //     'Regístrese',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: lightColorScheme.secondary,
                          //     ),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const SignUpScreen();
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = const Offset(0.0, -1.0);
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
                              'Regístrese',
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

  Widget _buildInputFields(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bg4.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: GlobalColors.titlePrimaryColor,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/welcome', (route) => false);
              },
            ),
            title: Text(
              'Inicia Sesión',
              style: TextStyle(
                color: GlobalColors.titlePrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: -15, // Ajusta este valor según sea necesario
          ),
        ],
      ),
    );
  }
}
