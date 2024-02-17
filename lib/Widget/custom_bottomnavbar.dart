import 'package:flutter/material.dart';

import '../Theme/global_colors.dart';
import '../Theme/theme.dart';

class CustomNavBar extends StatefulWidget {
  final Function currentIndex;
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
