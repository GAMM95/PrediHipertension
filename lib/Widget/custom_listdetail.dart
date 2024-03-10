// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:predihipertension/Theme/global_colors.dart';

class CustomListItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomListItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalColors.cardColor,
      ),
      padding: const EdgeInsets.all(10.0), // Padding del contenedor

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
