import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';

class ImageViewer extends StatelessWidget {
  final String imagePath;

  const ImageViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visor de Imagen',
          style: TextStyle(
            color: GlobalColors.titlePrimaryColor,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleSpacing: -8,
        iconTheme: IconThemeData(
          color: GlobalColors.titlePrimaryColor,
          size: 25.0,
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: true,
          boundaryMargin: EdgeInsets.zero,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
