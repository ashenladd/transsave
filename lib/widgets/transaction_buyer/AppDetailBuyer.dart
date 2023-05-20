import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/fonts.dart';

class AppDetailBuyer extends StatelessWidget {
  final bool isConfirmPaymentPage;

  const AppDetailBuyer({super.key, this.isConfirmPaymentPage = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isConfirmPaymentPage
            ? SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detail Pengiriman',
                    style: subtitleStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text('Salin', style: textButtonStyle)
                ],
              ),
        SizedBox(
          height: 8,
        ),
        DottedBorder(
          strokeWidth: 0.5,
          dashPattern: [7, 3, 7, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(6),
          child: Column(
            children: [
              Container(
                color: isConfirmPaymentPage ? Color(0xFFF9F9F9) : Color(0),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Penerima',
                          style: subtitleStyle.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          'M.Syaiful',
                          style: subtitleStyle.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nomor HP',
                          style: subtitleStyle.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Text(
                          '081276781218',
                          style: subtitleStyle.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Alamat',
                          style: subtitleStyle.copyWith(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        Container(
                          child: Flexible(
                            child: Text(
                              'Jl.Sukabirus No.25 Rt.06 Rw.13 Kel.Citeureup Kec.Dayeuhkolot Kab.Bandung Jawa Barat,ID,40257',
                              style:
                                  subtitleStyle.copyWith(color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
