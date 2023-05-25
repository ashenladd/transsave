import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/pages/transaction/seller/transaksi_seller.dart';
import 'package:transsave/themes/color.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/AppJoinCodeContainer.dart';
import 'package:transsave/widgets/AppTileItem.dart';
import 'package:transsave/widgets/AppTransactionStep.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppBottomsideBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppKeteranganContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppNegoButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppRectangleBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppUppersideBuyer.dart';

import '../../../model/TransactionModel.dart';
import '../../../themes/fonts.dart';

class TransaksiBuyer extends StatefulWidget {
  static String routeName = '/transaksi_buyer';
  const TransaksiBuyer({super.key});

  @override
  State<TransaksiBuyer> createState() => _TransaksiBuyerState();
}

class _TransaksiBuyerState extends State<TransaksiBuyer> {
  int id = Get.arguments;

  Nego nego = Nego.nego;
  // bool isJoin = true;
  // bool isPaid = false;
  // bool isThereNego = false;
  // bool isNegoAccepted = false;
  // bool isDoneProcessed = false;
  // bool isSent = false;
  // bool isSentSuccess = false;

  TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(id);
    bool isButtonActive =
        transaction.status == Status.join && nego == Nego.notNego;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor2,
      appBar: CustomAppBar(
        title: 'Transaksi',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          AppTransactionStep(
            status: transaction.status,
          ),
          SizedBox(
            height: 20,
          ),
          AppRectangleBuyer(
            status: transaction.status,
            nego: nego,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Barang Pembelian',
                      style: mainStyle.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  AppTileItem(
                    id: transaction.productId,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppUppersideBuyer(
                    transaction: transaction,
                    nego: nego,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AppBottomsideBuyer(
                    status: transaction.status,
                    nego: nego,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        width: 148,
                        text: 'BAYAR SEKARANG',
                        isActive: isButtonActive,
                      ),
                      AppNegoButton(
                        text: 'Nego',
                        isActive: isButtonActive,
                      ),
                      AppChatContainer(
                        isActive: isButtonActive,
                      )
                    ],
                  )
                ],
              )),
        ],
      ))),
    );
  }
}
