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
import 'package:transsave/widgets/transaction_seller/AppLowerSide.dart';

import '../../../controller/TransactionController.dart';
import '../../../model/TransactionModel.dart';
import '../../../themes/fonts.dart';
import '../../../widgets/AppChatContainer.dart';
import '../../../widgets/transaction_seller/AppChoiceButton.dart';
import '../../../widgets/transaction_seller/AppRectangleSeller.dart';

class TransaksiSeller extends StatefulWidget {
  String arguments = Get.arguments;
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
      appBar: const CustomAppBar(
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
              const SizedBox(
                height: 20,
              ),
              AppRectangleSeller(
                status: transaction.status,
                nego: nego,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Barang Pembelian',
                      style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTileItem(
                      id: transaction.id,
                    ),
                    !(transaction.status == Status.doneProcessed)
                        ? Center(
                            child: AppJoinCodeContainer(
                              code: '${transaction.room.id}',
                            ),
                          )
                        : const AppKeteranganContainerSeller(),
                    const SizedBox(
                      height: 10,
                    ),
                    transaction.status == Status.sentSuccess
                        ? Column(
                            children: [
                              AppDetailSeller(
                                transaction: transaction,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              getContainer(transaction)
                            ],
                          )
                        : getContainer(transaction),
                    const SizedBox(
                      height: 27,
                    ),
                    AppLowerSide(transaction: transaction, nego: nego)
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
