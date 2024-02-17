import 'package:flutter/material.dart';

import '../Containers/historial_tab.dart';
import '../Containers/info_tab.dart';
import '../Containers/profile_tab.dart';
import '../Containers/test_tab.dart';

class RoutesPages extends StatelessWidget {
  final int index;
  const RoutesPages({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const TestTab(),
      const HistorialTab(),
      const InfoTab(),
      const ProfileTab(),
    ];
    return myList[index];
  }
}
