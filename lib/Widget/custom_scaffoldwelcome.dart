import 'package:flutter/material.dart';

class CustomScaffoldWelcome extends StatelessWidget {
  const CustomScaffoldWelcome({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Image.asset(
          'assets/images/bg3.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: child!,
        )
      ]),
    );
  }
}
