import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Widget reutilizable para mostrar un elemento de lista con una animación Lottie.
class ListaItems extends StatelessWidget {
  /// El texto del elemento de la lista.
  final String parrafo;

  /// El color del texto del elemento de la lista.
  final Color color;

  /// Constructor para crear un elemento de lista.
  const ListaItems({
    super.key,
    required this.parrafo,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          width: 45,
          height: 45,
          child: Lottie.asset(
            'assets/animations/item.json',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 12, 15, 0),
            child: Text(
              parrafo,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: color,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
