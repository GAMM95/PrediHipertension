import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Text label;
  final String validator;
  final bool showNextButton;
  final GlobalKey<FormState>? formKey;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    required this.label,
    required this.validator,
    required this.controller,
    this.showNextButton = false,
    this.formKey,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // keyboardType: widget.textInputType,
      obscureText: obscureText,
      obscuringCharacter: '•',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validator;
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: IconButton(
            color: GlobalColors.hintText,
            icon: obscureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ),
        label: widget.label,
        labelStyle: TextStyle(
          color: GlobalColors.hintText,
          fontSize: 14,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: GlobalColors.hintText,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: GlobalColors.borderTextField,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.borderTextField,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.enabledBorderTextField,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textInputAction: widget.showNextButton ? TextInputAction.next : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
