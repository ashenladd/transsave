import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/home/AppHistoryTransactionItem.dart';
import 'package:transsave/widgets/home/AppTransactionItem.dart';

class Transaksi extends StatelessWidget {
  const Transaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: null,
        title: 'Transaksi',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Transaksi Berlangsung',
              style: headingStyle,
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
                                width: 25,
                              )
                            ],
                          )),
                )),
            SizedBox(
              height: 25,
            ),
            Text(
              'Riwayat Transaksi',
              style: headingStyle,
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                    4,
                    (index) => Column(
                          children: [
                            AppHistoryTransactionItem(),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
