import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transsave/themes/color.dart';
import 'package:transsave/themes/fonts.dart';

import '../../widgets/auth/AppButton.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  static String routeName = "/on_boarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 71, left: 68, right: 68, bottom: 93),
                  child: Image.asset('assets/on_boarding/onBoarding.png'),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 43),
                    child: RichText(
                      text: TextSpan(
                          text: 'Transaksi yang ',
                          style: GoogleFonts.quicksand(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: AppColor.titleColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Aman dan Mudah',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                color: AppColor.mainRed,
                              ),
                            ),
                            TextSpan(
                                text: ' di ujung jari Anda!',
                                style: GoogleFonts.quicksand(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.titleColor))
                          ]),
                    )),
                Container(
                  margin: EdgeInsets.only(
                      left: 46, top: 40, bottom: 50, right: 116),
                  child: Text(
                    'Mulai transaksi Sekarang dengan Transafe',
                    style: GoogleFonts.poppins(
                        fontSize: 17, color: Color(0xFF848484)),
                  ),
                ),
                GestureDetector(
                  child: AppButton(
                    text: "Ayo Mulai !",
                  ),
                  onTap: () => {},
                )
              ])),
        ));
  }
}
