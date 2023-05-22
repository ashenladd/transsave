import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_buyer.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';

import '../../../themes/color.dart';
import '../../../themes/fonts.dart';

class TransaksiKonfirmasiJoin extends StatelessWidget {
  static String routeName = '/transaksi_konfirmasi_join';
  const TransaksiKonfirmasiJoin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor2,
      appBar: CustomAppBar(leading: Icon(Icons.close)),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.backgroundColor3,
              ),
              margin: EdgeInsets.symmetric(horizontal: 14),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/transaction_buyer/buyer_konfirmasi.svg',
                    width: 108,
                    height: 108,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Konfirmasi Join",
                    style: titleStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFFE2E9EB),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Produk Dijual',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Poco F4 6/128 Hitam',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kategori',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Fisik',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dijual oleh',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Ali Marapaung',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              )),
          SizedBox(
            height: 65,
          ),
          AppButton(
            text: 'JOIN TRANSAKSI',
            width: 215,
            onTap: () => Get.toNamed(TransaksiBuyer.routeName),
          )
        ],
      )),
    );
  }
}
