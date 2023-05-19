import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppDarkContainer extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;

  const AppDarkContainer(
      {super.key,
      required this.isJoin,
      required this.isPaid,
      required this.isThereNego});

  Widget getContainerContent() {
    if (isJoin && !isPaid & isThereNego) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga Sebelumya',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 2.500.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xFFE2E9EB),
          ),
          Text(
            'Harga Nego',
            style: subtitleStyle2.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Rp. 2.300.000',
            style: titleStyle.copyWith(color: Colors.white, fontSize: 16),
          )
        ],
      );
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor3,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: getContainerContent());
  }
}
