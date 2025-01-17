import 'package:flutter/material.dart';
import '../../Core/Theme/global_colors.dart';

class CustomDropDown extends StatefulWidget {
  final String hintText;
  final String? label;
  final List<String> items;
  final String? defaultValue;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged;

  const CustomDropDown({
    super.key,
    required this.hintText,
    this.label,
    required this.items,
    this.defaultValue,
    this.controller,
    this.onChanged,
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
    if (widget.controller != null) {
      widget.controller!.text = dropdownValue;
    }
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
            if (widget.controller != null) {
              widget.controller!.text = newValue;
            }
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          }
        },
        // Corrección: Quitar dropdownBuilder
      ),
    );
  }
}
