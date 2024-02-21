// import 'package:flutter/material.dart';
// import '../Theme/global_colors.dart';
// import '../Theme/theme.dart';

// class CustomNavBar extends StatefulWidget {
//   final Function(int) currentIndex;
//   const CustomNavBar({super.key, required this.currentIndex});

//   @override
//   State<CustomNavBar> createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: index,
//       onTap: (int i) {
//         setState(() {
//           index = i;
//           widget.currentIndex(i);
//         });
//       },
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.grey,
//       selectedItemColor: lightColorScheme.primary,
//       backgroundColor: GlobalColors.bgDark1,
//       iconSize: 30.0,
//       selectedFontSize: 14.0,
//       unselectedFontSize: 12.0,
//       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//       unselectedLabelStyle: const TextStyle(fontSize: 0),
//       items: [
//         _buildBottomNavigationBarItem(Icons.text_snippet, 'Test', 0),
//         _buildBottomNavigationBarItem(Icons.history_rounded, 'Historial', 1),
//         _buildBottomNavigationBarItem(Icons.info, 'Información', 2),
//         _buildBottomNavigationBarItem(Icons.person, 'Perfil', 3),
//       ],
//     );
//   }

//   BottomNavigationBarItem _buildBottomNavigationBarItem(
//       IconData iconData, String label, int currentIndex) {
//     return BottomNavigationBarItem(
//       icon: index != currentIndex
//           ? SizedBox(
//               width: 24,
//               height: 24,
//               child: Icon(iconData),
//             )
//           : Icon(iconData),
//       label: index == currentIndex ? label : '',
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';
import '../Theme/theme.dart';

/// Widget para la barra de navegación personalizada.
class CustomNavBar extends StatefulWidget {
  /// Índice actual de la barra de navegación.
  final Function(int) currentIndex;

  /// Constructor de CustomNavBar.
  const CustomNavBar({super.key, required this.currentIndex});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: lightColorScheme.primary,
      backgroundColor: GlobalColors.bgDark1,
      iconSize: 30.0,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Test',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history_rounded),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Información',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import '../Theme/global_colors.dart';
// import '../Theme/theme.dart';

// class CustomNavBar extends StatefulWidget {
//   final Function(int) currentIndex;
//   const CustomNavBar({Key? key, required this.currentIndex}) : super(key: key);

//   @override
//   State<CustomNavBar> createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: index,
//       onTap: (int i) {
//         setState(() {
//           index = i;
//           widget.currentIndex(i);
//         });
//       },
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.grey,
//       selectedItemColor: lightColorScheme.primary,
//       backgroundColor: GlobalColors.bgDark1,
//       iconSize: 30.0,
//       selectedFontSize: 14.0,
//       unselectedFontSize: 12.0,
//       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//       unselectedLabelStyle: const TextStyle(fontSize: 0),
//       items: [
//         _buildBottomNavigationBarItem(Icons.text_snippet, 'Test', 0),
//         _buildBottomNavigationBarItem(Icons.history_rounded, 'Historial', 1),
//         _buildBottomNavigationBarItem(Icons.info, 'Información', 2),
//         _buildBottomNavigationBarItem(Icons.person, 'Perfil', 3),
//       ],
//     );
//   }

//   BottomNavigationBarItem _buildBottomNavigationBarItem(
//       IconData iconData, String label, int currentIndex) {
//     return BottomNavigationBarItem(
//       icon: index != currentIndex
//           ? Padding(
//               padding: const EdgeInsets.symmetric(
//                   vertical: 6.0), // Ajuste del relleno vertical
//               child: Icon(iconData),
//             )
//           : Icon(iconData),
//       label: index == currentIndex ? label : '',
//     );
//   }
// }
