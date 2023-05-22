import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 18),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset('assets/bottom_app_bar/home.svg'),
            SvgPicture.asset('assets/bottom_app_bar/Document.svg'),
            SvgPicture.asset('assets/bottom_app_bar/Notification.svg'),
            SvgPicture.asset('assets/bottom_app_bar/Profile.svg')
          ])),
    );
  }
}
