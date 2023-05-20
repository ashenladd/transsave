import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppChoiceButton extends StatelessWidget {
  final bool isAgree;
  final Function()? onTap;

  const AppChoiceButton({super.key, this.onTap, required this.isAgree});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isAgree ? Color(0xFF3787FF) : Color(0xFFFF0000),
        ),
        child: Center(
            child: Text(
          isAgree ? "SETUJUI" : "TOLAK",
          style: buttonStyle,
        )),
      ),
      onTap: onTap,
    );
  }
}
