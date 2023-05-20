import 'package:flutter/material.dart';

import '../../themes/fonts.dart';

class AppDetailBayar extends StatelessWidget {
  const AppDetailBayar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metode Pembayaran',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                'Dana',
                style: subtitleStyle2.copyWith(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                'Rp. 2.317.500',
                style: subtitleStyle2.copyWith(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Waktu Pembayaran',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                '15-05-2023 14:36',
                style: subtitleStyle2.copyWith(color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
