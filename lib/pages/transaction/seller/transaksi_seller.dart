import 'package:flutter/material.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_seller/AppDarkContainerSeller.dart';
import 'package:transsave/widgets/transaction_seller/AppDetailSeller.dart';
import 'package:transsave/widgets/AppJoinCodeContainer.dart';
import 'package:transsave/widgets/transaction_seller/AppKeteranganContainerSeller.dart';
import 'package:transsave/widgets/AppTileItem.dart';
import 'package:transsave/widgets/AppTransactionStep.dart';
import 'package:transsave/widgets/CustomAppBar.dart';

import '../../../themes/fonts.dart';
import '../../../widgets/AppChatContainer.dart';
import '../../../widgets/transaction_seller/AppChoiceButton.dart';
import '../../../widgets/transaction_seller/AppRectangleSeller.dart';

class TransaksiSeller extends StatefulWidget {
  static String routeName = '/transaksi_seller';
  const TransaksiSeller({super.key});

  @override
  State<TransaksiSeller> createState() => _TransaksiSellerState();
}

class _TransaksiSellerState extends State<TransaksiSeller> {
  @override
  Widget build(BuildContext context) {
    bool isJoin = true;
    bool isPaid = false;
    bool isThereNego = false;
    bool isDoneProcessed = true;
    bool isSent = false;
    bool isSentSuccess = false;
    bool isTransactionSuccess = false;

    Widget getContainer() {
      if (isJoin && !isPaid & isThereNego) {
        return AppDarkContainerSeller(
          isJoin: isJoin,
          isPaid: isPaid,
          isDoneProcessed: isDoneProcessed,
          isThereNego: isThereNego,
          isSent: isSent,
          isSentSuccess: isSentSuccess,
        );
      } else if (isJoin &&
          isPaid &&
          isDoneProcessed &&
          isSent &&
          isSentSuccess) {
        return AppDarkContainerSeller(
          isJoin: isJoin,
          isPaid: isPaid,
          isDoneProcessed: isDoneProcessed,
          isThereNego: isThereNego,
          isSent: isSent,
          isSentSuccess: isSentSuccess,
        );
      } else {
        return AppDetailSeller(
            isJoin: isJoin,
            isPaid: isPaid,
            isThereNego: isThereNego,
            isDoneProcessed: isDoneProcessed,
            isSent: isSent,
            isSentSuccess: isSentSuccess,
            isTransactionSuccess: isTransactionSuccess);
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Transaksi',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            AppRectangleSeller(
              isJoin: isJoin,
              isPaid: isPaid,
              isThereNego: isThereNego,
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
                  Text(
                    'Barang Pembelian',
                    style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppTileItem(),
                  SizedBox(
                    height: 34,
                  ),
                  !(isJoin && isPaid && isDoneProcessed)
                      ? Center(
                          child: AppJoinCodeContainer(
                            code: 'A52PX2',
                          ),
                        )
                      : AppKeteranganContainerSeller(),
                  SizedBox(
                    height: 10,
                  ),
                  isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess
                      ? Column(
                          children: [
                            AppDetailSeller(
                                isJoin: isJoin,
                                isPaid: isPaid,
                                isThereNego: isThereNego,
                                isDoneProcessed: isDoneProcessed,
                                isSent: isSent,
                                isSentSuccess: isSentSuccess,
                                isTransactionSuccess: isTransactionSuccess),
                            SizedBox(
                              height: 10,
                            ),
                            getContainer()
                          ],
                        )
                      : getContainer(),
                  SizedBox(
                    height: 27,
                  ),
                  isJoin && !isPaid & isThereNego
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppChoiceButton(
                              isAgree: true,
                            ),
                            AppChoiceButton(
                              isAgree: false,
                            ),
                            AppChatContainer(
                              isActive: true,
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              text: 'BAGIKAN KODE',
                              width: 233,
                            ),
                            AppChatContainer(
                              isActive: true,
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
