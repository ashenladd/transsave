import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppNegoButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double width;
  final bool isActive;

  const AppNegoButton(
      {super.key,
      this.text = 'text',
      this.onTap,
      this.width = 90,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isActive ? AppColor.backgroundColor3 : AppColor.subtitleColor,
          ),
          height: 54,
          width: width,
          child: Center(
              child: Text(
            text,
            style: buttonStyle,
          )),
        ),
        onTap: isActive ? onTap : null);
  }
}
