import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';
import 'package:predihipertension/Core/Theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const CustomButton({
    super.key,
    required this.texto,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (!isEnabled) {
                  return GlobalColors.disabledButton;
                }
                if (states.contains(MaterialState.pressed)) {
                  return lightColorScheme.primary;
                }
                return GlobalColors.activeButton;
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (!isEnabled) {
                  return GlobalColors.disabledTextButton;
                }
                return GlobalColors.enabledTextButton;
              },
            ),
            overlayColor: MaterialStateProperty.all(lightColorScheme.primary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: isEnabled
                      ? lightColorScheme.primary
                      : GlobalColors.disabledButton,
                ),
              ),
            ),
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 16.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
