import 'package:flutter/material.dart';
import 'package:transsave/model/TransactionModel.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppDarkContainerSeller extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isThereNego;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;

  final Status status;
  final Nego nego;

  const AppDarkContainerSeller(
      {super.key, required this.status, required this.nego});

  Widget getContainerContent() {
    if (status == Status.join && nego == Nego.nego) {
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
    } else if (status == Status.sent) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 2.500.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkos Kirim',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 15.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xFFE2E9EB),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Diterima',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 2.315.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 2.500.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ongkos Kirim',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 15.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Color(0xFFE2E9EB),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Diterima',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Rp. 2.315.000',
                style: subtitleStyle2.copyWith(color: Colors.white),
              )
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColor.backgroundColor3,
        ),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: getContainerContent());
  }
}
