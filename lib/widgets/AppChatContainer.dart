import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transsave/themes/color.dart';

class AppChatContainer extends StatelessWidget {
  final Function()? onTap;
  final bool isActive;
  const AppChatContainer({super.key, this.onTap, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 14),
        decoration: BoxDecoration(
            border: Border.all(
                color: isActive ? AppColor.mainRed : Color(0xFFE5E5E5)),
            borderRadius: BorderRadius.circular(10)),
        child: SvgPicture.asset(
          'assets/transaction/chat_icon.svg',
          color: isActive ? AppColor.mainRed : AppColor.subtitleColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
