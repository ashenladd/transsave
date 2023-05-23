import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/TransactionModel.dart';
import '../../themes/fonts.dart';

class AppDetailSeller extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isThereNego;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;
  final Status status;

  const AppDetailSeller({
    super.key,
    required this.status,
  });

  Widget getDetailBarang() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nego Harga',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                'Aktif',
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
                'Ongkos Kirim',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                'Rp. 0',
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
                'Berat',
                style: subtitleStyle2.copyWith(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                '0 gram',
                style: subtitleStyle2.copyWith(color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getDetailPengiriman() {
    return Column(
      children: [
        Row(
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

  Widget getContent() {
    if (status == Status.notJoin) {
      return getDetailBarang();
    } else if (status == Status.join) {
      return getDetailBarang();
    } else if (status == Status.paid) {
      return getDetailBarang();
    } else if (status == Status.doneProcessed) {
      return getDetailPengiriman();
    } else if (status == Status.sent) {
      return getDetailPengiriman();
    } else if (status == Status.sentSuccess) {
      return getDetailPengiriman();
    }
    return getDetailBarang();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
