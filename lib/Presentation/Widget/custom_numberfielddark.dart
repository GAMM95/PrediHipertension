import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:predihipertension/Core/Theme/global_colors.dart';

class CustomNumberFieldDark extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Text label;
  final bool enabled;
  final String validator;
  final int cifras;
  final bool showNextButton;

  const CustomNumberFieldDark({
    super.key,
    required this.hintText,
    required this.label,
    required this.validator,
    required this.controller,
    required this.enabled,
    required this.cifras,
    this.showNextButton = false,
  });

  @override
  State<CustomNumberFieldDark> createState() => _CustomNumberFieldDarkState();
}

class _CustomNumberFieldDarkState extends State<CustomNumberFieldDark> {
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
      style: TextStyle(color: GlobalColors.bgDark2),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.cifras),
      ],
      decoration: InputDecoration(
        labelText: widget.label.data,
        labelStyle: TextStyle(
          color: GlobalColors.bgPanelDark,
          fontSize: 14,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: GlobalColors.hinTextDark,
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
            color: GlobalColors.bgPanelDark,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.bgPanelDark,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textInputAction: widget.showNextButton ? TextInputAction.next : null,
    );
  }
}
