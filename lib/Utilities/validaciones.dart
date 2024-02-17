// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Validaciones {
//   static bool validateUsername(String username, BuildContext context) {
//     if (username.trim().isEmpty) {
//       _showErrorDialog(context, 'Ingrese su usuario');
//       return false;
//     }
//     return true;
//   }

//   static bool validateEmail(String email, BuildContext context) {
//     final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
//     if (email.trim().isEmpty) {
//       _showErrorDialog(context, 'Ingrese su correo electrónico');
//       return false;
//     } else if (!emailRegex.hasMatch(email.trim())) {
//       _showErrorDialog(context, 'Correo electrónico inválido');
//       return false;
//     }
//     return true;
//   }

//   static bool validatePassword(String password, BuildContext context) {
//     if (password.trim().isEmpty) {
//       _showErrorDialog(context, 'Ingrese su contraseña');
//       return false;
//     } else if (password.trim().length < 6) {
//       _showErrorDialog(
//           context, 'La contraseña debe tener al menos 6 caracteres');
//       return false;
//     }
//     return true;
//   }

//   static bool validateInputs({
//     required String username,
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) {
//     return validateUsername(username, context) &&
//         validateEmail(email, context) &&
//         validatePassword(password, context);
//   }

//   static void _showErrorDialog(BuildContext context, String message) {
//     showDialog(
//       barrierDismissible: true,
//       context: context,
//       builder: (context) {
//         Future.delayed(const Duration(seconds: 2), () {
//           Navigator.of(context)
//               .pop(true); // Cierra el diálogo después de 3 segundos
//         });
//         return AlertDialog(
//           backgroundColor: Colors.red[50],
//           icon: Lottie.asset(
//             'assets/animations/alert.json',
//             width: 80,
//             height: 80,
//           ),
//           content: Text(
//             message,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 16),
//           ),
//         );
//       },
//     );
//   }
// }
