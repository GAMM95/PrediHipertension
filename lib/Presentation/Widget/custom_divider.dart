import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 0.7,
            color: GlobalColors.borderTextField,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
          child: Text(
            'O',
            style: TextStyle(
              color: GlobalColors.textColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 0.7,
            color: GlobalColors.borderTextField,
          ),
        ),
      ],
    );
  }
}
