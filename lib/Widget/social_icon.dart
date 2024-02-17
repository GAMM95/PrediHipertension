import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// class SocialIcons extends StatelessWidget {
//   final String ruta;
//   final String texto;

//   const SocialIcons({
//     super.key,
//     required this.ruta,
//     required this.texto,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.all(15),
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.white,
//         ),
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.grey[200],
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 5,
//             offset: Offset(-1, 2),
//           )
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // const SizedBox(width: 10.0),
//           SvgPicture.asset(
//             ruta,
//             height: 30,
//           ),
//           const SizedBox(width: 20.0), // Espacio entre el icono y el texto
//           Text(
//             texto,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SocialIcons extends StatelessWidget {
  final String ruta;
  final String texto;
  final VoidCallback? onPressed;

  const SocialIcons({
    super.key,
    required this.ruta,
    required this.texto,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Agregar la función onPressed al GestureDetector
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          // horizontal: 20.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(-1, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ruta,
              height: 30,
            ),
            const SizedBox(width: 20.0),
            Text(
              texto,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
