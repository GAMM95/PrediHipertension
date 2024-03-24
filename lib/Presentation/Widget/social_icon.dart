import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Widget reutilizable para mostrar iconos sociales.
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
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
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
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}