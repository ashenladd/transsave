import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_buyer.dart';

import '../../controller/TransactionController.dart';
import '../../model/TransactionModel.dart';
import '../../themes/fonts.dart';

class AppDetailSeller extends StatelessWidget {
  Transaction transaction;

  AppDetailSeller({
    super.key,
    required this.transaction,
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
                '${transaction.negotiable ? 'Aktif' : 'Non-Aktif'}',
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
                'Rp. ${transaction.shipping_fee}',
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
    switch (transaction.status) {
      case Status.doneProcessed:
      case Status.sent:
      case Status.sentSuccess:
        return getDetailPengiriman();
      case Status.notJoin:
      case Status.join:
      case Status.paid:
        return getDetailBarang();
      default:
        return getDetailBarang();
    }
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
