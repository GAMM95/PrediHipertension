import 'package:flutter/material.dart';

import '../../Core/Theme/global_colors.dart';

/// Widget que muestra una imagen en un visor interactivo.
class ImageViewer extends StatelessWidget {
  /// Ruta de la imagen que se mostrará en el visor.
  final String imagePath;

  /// Constructor que recibe la ruta [imagePath] de la imagen.
  const ImageViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.appBarColor,
        title: Text(
          'Visor de Imagen',
          style: TextStyle(
            color: GlobalColors.titlePrimaryColor,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleSpacing: -8, // Espaciado personalizado del título
        iconTheme: IconThemeData(
          color: GlobalColors.titlePrimaryColor,
          size: 25.0,
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: true, // Habilitar escalado de la imagen
          boundaryMargin: EdgeInsets.zero, // Sin margen de límite
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
