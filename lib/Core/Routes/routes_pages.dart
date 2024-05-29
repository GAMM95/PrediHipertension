import 'package:flutter/material.dart';

import '../../Presentation/Containers/historial_tab.dart';
import '../../Presentation/Containers/info_tab.dart';
import '../../Presentation/Containers/profile_tab.dart';
import '../../Presentation/Containers/test_tab.dart';

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
