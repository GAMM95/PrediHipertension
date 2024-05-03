import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

class CustomGestureDetector extends StatelessWidget {
  final String text;
  final String routeName;
  final bool showDivider;

  const CustomGestureDetector({
    super.key,
    required this.text,
    required this.routeName,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(routeName);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: GlobalColors.textColor,
                  ),
                )
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
      ],
    );
  }
}
