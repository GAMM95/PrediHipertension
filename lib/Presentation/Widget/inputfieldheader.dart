import 'package:flutter/material.dart';
import '../../Core/Theme/global_colors.dart';
import '../Widget/custom_clipper.dart';

class InputFieldsHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const InputFieldsHeader({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: GlobalColors.titlePrimaryColor,
                size: 20,
              ),
              onPressed: onBackPressed,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: GlobalColors.titlePrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: -15,
          ),
        ],
      ),
    );
  }
}
