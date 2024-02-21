import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              isEnabled ? Colors.grey : Colors.red,
            ),
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 14.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
