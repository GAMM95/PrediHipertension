import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

class CustomDropDown extends StatefulWidget {
  final String hintText;
  final String? label;
  final List<String> items;
  final String? defaultValue;
  final TextEditingController? controller;

  const CustomDropDown({
    super.key,
    required this.hintText,
    this.label,
    required this.items,
    this.defaultValue,
    this.controller,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: dropdownValue.isNotEmpty ? dropdownValue : null,
        itemHeight: 50,
        decoration: InputDecoration(
          labelText: widget.label,
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
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: GlobalColors.hintText,
        ),
        dropdownColor: GlobalColors.bgDark1,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: GlobalColors.hintText,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              dropdownValue = newValue;
            });
            widget.controller?.text = newValue;
          }
        },
      ),
    );
  }
}
