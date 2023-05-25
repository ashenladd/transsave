import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_seller/AppDarkContainerSeller.dart';
import 'package:transsave/widgets/transaction_seller/AppDetailSeller.dart';
import 'package:transsave/widgets/AppJoinCodeContainer.dart';
import 'package:transsave/widgets/transaction_seller/AppKeteranganContainerSeller.dart';
import 'package:transsave/widgets/AppTileItem.dart';
import 'package:transsave/widgets/AppTransactionStep.dart';
import 'package:transsave/widgets/CustomAppBar.dart';

import '../../../controller/TransactionController.dart';
import '../../../model/TransactionModel.dart';
import '../../../themes/fonts.dart';
import '../../../widgets/AppChatContainer.dart';
import '../../../widgets/transaction_seller/AppChoiceButton.dart';
import '../../../widgets/transaction_seller/AppRectangleSeller.dart';

class TransaksiSeller extends StatefulWidget {
  int arguments = Get.arguments;
  static String routeName = '/transaksi_seller';
  TransaksiSeller({super.key});

  @override
  State<TransaksiSeller> createState() => _TransaksiSellerState();
}

class _TransaksiSellerState extends State<TransaksiSeller> {
  TransactionController transactionController =
      Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    Nego nego = Nego.notNego;

    // bool isJoin = true;
    // bool isPaid = true;
    // bool isThereNego = false;
    // bool isDoneProcessed = true;
    // bool isSent = true;
    // bool isSentSuccess = true;

    Widget getContainer(Transaction transaction) {
      if (transaction.status == Status.join && nego == Nego.nego) {
        return AppDarkContainerSeller(
          id: transaction.id,
          nego: nego,
        );
      } else if (transaction.status == Status.sentSuccess) {
        return AppDarkContainerSeller(
          id: transaction.id,
          nego: nego,
        );
      } else {
        return AppDetailSeller(
          transaction: transaction,
        );
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Transaksi',
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: GetBuilder<TransactionController>(builder: (context) {
          Transaction transaction =
              context.getTransactionById(widget.arguments);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTransactionStep(status: transaction.status),
              SizedBox(
                height: 20,
              ),
              AppRectangleSeller(
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
                    Text(
                      'Barang Pembelian',
                      style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AppTileItem(
                      id: transaction.productId,
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    !(transaction.status == Status.doneProcessed)
                        ? Center(
                            child: AppJoinCodeContainer(
                              code: '${transaction.roomId}',
                            ),
                          )
                        : AppKeteranganContainerSeller(),
                    SizedBox(
                      height: 10,
                    ),
                    transaction.status == Status.sentSuccess
                        ? Column(
                            children: [
                              AppDetailSeller(
                                transaction: transaction,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              getContainer(transaction)
                            ],
                          )
                        : getContainer(transaction),
                    SizedBox(
                      height: 27,
                    ),
                    transaction.status == Status.join && nego == Nego.nego
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
          );
        }),
      )),
    );
  }
}
