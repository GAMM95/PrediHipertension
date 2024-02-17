import 'package:flutter/material.dart';

class DetalleTest {
  static void mostrarDetalle(
      BuildContext context, TextEditingController imcController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Detalle Test',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Reporte de test de hipertensión realizada en la fecha __/__/___',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const ListTile(
                  title: Text(
                    'Edad:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Edad ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),

                const ListTile(
                  title: Text(
                    'Genero:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Genero ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),

                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),

                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Índice de Masa Corporal (IMC):',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'IMC ingresada',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Boton Guardar Reporte en PDF
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Exportar Reporte'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
