import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppDarkContainerBuyer extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;

  const AppDarkContainerBuyer(
      {super.key,
      required this.isJoin,
      required this.isPaid,
      required this.isThereNego,
      required this.isDoneProcessed,
      required this.isSent,
      required this.isSentSuccess});

  Widget getContainerContent() {
    if (isJoin) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dijual Oleh:',
                style: subtitleStyle2.copyWith(
                    color: Colors.white.withOpacity(0.4)),
              ),
              Text(
                'Ali Marpaung',
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
              Column(
                children: [
                  Text(
                    'Ongkos Kirim:',
                    style: subtitleStyle.copyWith(
                        color: Colors.white.withOpacity(0.4)),
                  ),
                  Text(
                    'Rp. 15.000',
                    style: subtitleStyle2.copyWith(color: Colors.white),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xFFE2E9EB)),
                        left: BorderSide(color: Color(0xFFE2E9EB)))),
                child: Column(
                  children: [
                    Text(
                      'Berat:',
                      style: subtitleStyle.copyWith(
                          color: Colors.white.withOpacity(0.4)),
                    ),
                    Text(
                      '1000 gr',
                      style: subtitleStyle2.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Biaya Admin:',
                    style: subtitleStyle.copyWith(
                        color: Colors.white.withOpacity(0.4)),
                  ),
                  Text(
                    'Rp. 2.500',
                    style: subtitleStyle2.copyWith(color: Colors.white),
                  )
                ],
              )
            ],
          )
        ],
      );
    } else if (isJoin &&
        isPaid &&
        isDoneProcessed &&
        isSent &&
        !isSentSuccess) {
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
    } else if (isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess) {
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
    return Text('');
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
