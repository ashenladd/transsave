import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/pages/transaction/seller/buat_transaksi.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/home/AppJoinPopup.dart';
import 'package:transsave/widgets/home/AppTransactionItem.dart';

import '../../widgets/home/CustomBottomAppBart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<void> _displayJoinCode(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AppJoinPopup();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                width: 355,
                height: 262,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage('assets/home/Background.png'),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/home/logo.png',
                            scale: 1.7,
                          ),
                          CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                AssetImage('assets/home/profile.png'),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      Text('Hi, Ali!',
                          style: GoogleFonts.quicksand(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Total Saldo',
                        style: mainStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp 1.200.000',
                            style: mainStyle.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            'Tarik Saldo',
                            style: textButtonStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13),
                          )
                        ],
                      )
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                              width: 150,
                              text: 'Buat Transaksi',
                              onTap: () {
                                Get.toNamed(BuatTransaksi.routeName);
                              }),
                          AppButton(
                            width: 150,
                            text: 'Gabung Transaksi',
                            onTap: () {
                              _displayJoinCode(context);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          SvgPicture.asset('assets/home/Cover.svg'),
                          SizedBox(
                            width: 25,
                          ),
                          SvgPicture.asset('assets/home/Cover.svg'),
                          SizedBox(
                            width: 25,
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Transaksi berlangsung',
                        style: titleStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                          4,
                          (index) => Row(
                            children: [
                              AppTransactionItem(),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        )),
                      ),
                    ]),
              )
            ],
          )),
        ));
  }
}
