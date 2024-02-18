import 'package:flutter/material.dart';
import 'package:predihipertension/Theme/global_colors.dart';

import 'info1_tab.dart';
import 'info2_tab.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Información',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              // color: GlobalColors.titlePanel,
            ),
          ),
          centerTitle: true,
          elevation: 3,
          shadowColor: Colors.black26,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 235, 183, 192),
                  Color.fromARGB(255, 241, 200, 206),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            labelColor: GlobalColors.iconColor,
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
                  Icons.data_thresholding,
                  size: 30,
                ),
                // text: 'Datos y cifras',
              ),
              Tab(
                icon: Icon(
                  Icons.recommend,
                  size: 30,
                ),
                // text: 'Sugerencias',
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                // text: 'Perfil',
              ),
            ],
          ),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBarView(
                // physics:
                //     NeverScrollableScrollPhysics(), // Bloquea el desplazamiento
                children: [
                  Info1Tab(),
                  Info2Tab(),
                  Info2Tab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
