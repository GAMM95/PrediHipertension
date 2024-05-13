import 'package:flutter/material.dart';
import 'package:predihipertension/Core/Theme/global_colors.dart';

import 'info1_tab.dart';
import 'info2_tab.dart';
import 'info3_tab.dart';

/// Widget que muestra pestañas de información sobre definiciones, sugerencias y complicaciones.
class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [GlobalColors.bgDark2, GlobalColors.bgDark2],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: TabBar(
              unselectedLabelColor: const Color.fromARGB(96, 243, 243, 243),
              labelColor: GlobalColors.appBarColor,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: GlobalColors.titlePrimaryColor,
                    width: 5,
                  ),
                ),
              ),
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.book_sharp,
                    size: 30,
                  ),
                  text: 'Definiciones',
                ),
                Tab(
                  icon: Icon(
                    Icons.ballot,
                    size: 30,
                  ),
                  text: 'Sugerencias',
                ),
                Tab(
                  icon: Icon(
                    Icons.crisis_alert_outlined,
                    size: 30,
                  ),
                  text: 'Complicaciones',
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Info1Tab(),
                Info2Tab(),
                Info3Tab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
