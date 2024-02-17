import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';

class CustomDropDown extends StatefulWidget {
  final String hintText;
  final Text label;
  final List<String> items;

  const CustomDropDown({
    super.key,
    required this.hintText,
    required this.label,
    required this.items,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: dropdownValue.isNotEmpty ? dropdownValue : null,
        itemHeight: 50,
        decoration: InputDecoration(
          labelText: widget.label.data,
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
                fontSize: 16,
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
            // print('Item seleccionado: $newValue');
          }
        },
      ),
    );
  }
}
