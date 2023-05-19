import 'package:flutter/material.dart';

import '../../themes/fonts.dart';
import '/themes/color.dart';
import '/themes/fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double width;
  final Function()? onTap;

  const AppButton(
      {super.key, this.text = 'text', this.onTap, this.width = 286});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainRed,
        ),
        height: 54,
        width: width,
        child: Center(
            child: Text(
          text,
          style: buttonStyle,
        )),
      ),
      onTap: onTap,
    );
  }
}
