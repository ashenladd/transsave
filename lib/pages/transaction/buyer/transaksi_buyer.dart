import 'package:flutter/material.dart';
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

import '../../../themes/fonts.dart';

class TransaksiBuyer extends StatefulWidget {
  const TransaksiBuyer({super.key});

  @override
  State<TransaksiBuyer> createState() => _TransaksiBuyerState();
}

class _TransaksiBuyerState extends State<TransaksiBuyer> {
  bool isJoin = true;
  bool isPaid = true;
  bool isThereNego = false;
  bool isNegoAccepted = true;
  bool isDoneProcessed = true;
  bool isSent = true;
  bool isSentSuccess = true;

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = isJoin && !isPaid && !isThereNego;
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
            isJoin: isJoin,
            isPaid: isPaid,
            isDoneProcessed: isDoneProcessed,
            isSent: isSent,
            isSentSuccess: isSentSuccess,
          ),
          SizedBox(
            height: 20,
          ),
          AppRectangleBuyer(
            isJoin: isJoin,
            isPaid: isPaid,
            isThereNego: isThereNego,
            isNegoAccepted: isNegoAccepted,
            isDoneProcessed: isDoneProcessed,
            isSent: isSent,
            isSentSuccess: isSentSuccess,
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
                  AppTileItem(),
                  SizedBox(
                    height: 20,
                  ),
                  AppUppersideBuyer(
                    isJoin: isJoin,
                    isPaid: isPaid,
                    isThereNego: isThereNego,
                    isNegoAccepted: isNegoAccepted,
                    isDoneProcessed: isDoneProcessed,
                    isSent: isSent,
                    isSentSuccess: isSentSuccess,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AppBottomsideBuyer(
                      isJoin: isJoin,
                      isPaid: isPaid,
                      isThereNego: isThereNego,
                      isNegoAccepted: isNegoAccepted,
                      isDoneProcessed: isDoneProcessed,
                      isSent: isSent,
                      isSentSuccess: isSentSuccess),
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
