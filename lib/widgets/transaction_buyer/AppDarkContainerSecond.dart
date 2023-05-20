import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppDarkContainerSecond extends StatelessWidget {
  const AppDarkContainerSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColor.backgroundColor3,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ekspedisi',
                  style: subtitleStyle2.copyWith(
                      color: Colors.white.withOpacity(0.4)),
                ),
                Text(
                  'GoSend',
                  style: subtitleStyle2.copyWith(color: Colors.white),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No.Resi',
                  style: subtitleStyle2.copyWith(
                      color: Colors.white.withOpacity(0.4)),
                ),
                Row(children: [
                  Text(
                    'GSD80256IU6',
                    style: subtitleStyle2.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.copy,
                    color: Colors.white,
                    size: 14,
                  )
                ])
              ],
            ),
          ],
        ));
  }
}
