import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/global_colors.dart';

class CustomNumberField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? label;
  final bool enabled;
  final String validator;
  final int cifras;
  final bool showNextButton;

  const CustomNumberField({
    super.key,
    required this.hintText,
    this.label, 
    required this.validator,
    required this.controller,
    required this.enabled,
    required this.cifras,
    this.showNextButton = false,
  });

  @override
  State<CustomNumberField> createState() => _CustomNumberFieldState();
}

class _CustomNumberFieldState extends State<CustomNumberField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validator;
        }
        return null;
      },
      style: const TextStyle(color: Colors.white),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.cifras), // Limitar a 2 dígitos
      ],
      decoration: InputDecoration(
        labelText: widget.label, // Usar widget.label directamente
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
