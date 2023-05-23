import 'package:flutter/material.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_seller/AppDarkContainerSeller.dart';
import 'package:transsave/widgets/transaction_seller/AppDetailSeller.dart';
import 'package:transsave/widgets/AppJoinCodeContainer.dart';
import 'package:transsave/widgets/transaction_seller/AppKeteranganContainerSeller.dart';
import 'package:transsave/widgets/AppTileItem.dart';
import 'package:transsave/widgets/AppTransactionStep.dart';
import 'package:transsave/widgets/CustomAppBar.dart';

import '../../../model/TransactionModel.dart';
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
    Status status = Status.notJoin;
    Nego nego = Nego.notNego;

    // bool isJoin = true;
    // bool isPaid = true;
    // bool isThereNego = false;
    // bool isDoneProcessed = true;
    // bool isSent = true;
    // bool isSentSuccess = true;

    Widget getContainer() {
      if (status == Status.join && nego == Nego.nego) {
        return AppDarkContainerSeller(
          status: status,
          nego: nego,
        );
      } else if (status == Status.sentSuccess) {
        return AppDarkContainerSeller(
          status: status,
          nego: nego,
        );
      } else {
        return AppDetailSeller(
          status: status,
        );
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
            AppTransactionStep(status: status),
            SizedBox(
              height: 20,
            ),
            AppRectangleSeller(
              status: status,
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
                  !(status == Status.doneProcessed)
                      ? Center(
                          child: AppJoinCodeContainer(
                            code: 'A52PX2',
                          ),
                        )
                      : AppKeteranganContainerSeller(),
                  SizedBox(
                    height: 10,
                  ),
                  status == Status.sentSuccess
                      ? Column(
                          children: [
                            AppDetailSeller(status: status),
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
                  status == Status.join && nego == Nego.nego
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
