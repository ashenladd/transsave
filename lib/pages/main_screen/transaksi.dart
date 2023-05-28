import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/controller/UserController.dart';
import 'package:transsave/services/SecureStorageService.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/home/AppHistoryTransactionItem.dart';
import 'package:transsave/widgets/home/AppTransactionItem.dart';

import '../../constant/api.dart';
import '../../model/TransactionModel.dart';
import '../transaction/seller/transaksi_seller.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  TransactionController transactionController =
      Get.find<TransactionController>();

  Map<String, dynamic>? transaksiResponse;

  @override
  void initState() {
    transactionController.setTransactions();
    super.initState();
  }

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
              child: GetBuilder<TransactionController>(builder: (context) {
                return Row(
                    children: List.generate(
                  context.allTransactions.length,
                  (index) => Row(
                    children: [
                      GestureDetector(
                          child: AppTransactionItem(
                            transaction: context.allTransactions[index],
                          ),
                          onTap: () => Get.toNamed(TransaksiSeller.routeName,
                              arguments: context.allTransactions[index].id)),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ));
              }),
            ),
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
