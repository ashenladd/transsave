import 'package:flutter/material.dart';
import 'package:transsave/model/TransactionModel.dart';

import '../../themes/color.dart';
import '../../themes/fonts.dart';

class AppDarkContainerBuyer extends StatelessWidget {
  final Transaction transaction;
  const AppDarkContainerBuyer({
    super.key,
    required this.transaction,
  });

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
                      'Rp. ${transaction.shipping_fee}',
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
                        '2 gr',
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
                      'Rp. ${transaction.tax}',
                      style: subtitleStyle2.copyWith(color: Colors.white),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
