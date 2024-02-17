import 'package:flutter/material.dart';
import '../Theme/global_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Text label;
  final String validator;
  final bool enabled;
  final TextInputType textInputType;
  final bool applyTextCapitalization;
  final bool showNextButton;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.label,
    required this.validator,
    required this.controller,
    required this.enabled,
    required this.textInputType,
    this.applyTextCapitalization = false,
    this.showNextButton = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      keyboardType: widget.textInputType,
      textCapitalization: widget.applyTextCapitalization
          ? TextCapitalization.words
          : TextCapitalization.none,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validator;
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: widget.label,
        labelStyle: TextStyle(
          color: GlobalColors.hintText,
          fontSize: 16,
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
      textInputAction: widget.showNextButton
          ? TextInputAction.next
          : null, // Establecer TextInputAction.next solo cuando se requiera
    );
  }
}
