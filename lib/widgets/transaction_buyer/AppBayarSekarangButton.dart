import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_konfirmasi_bayar.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

import 'AppNegoButton.dart';

class AppBayarSekarangButton extends StatelessWidget {
  final String id;
  AppBayarSekarangButton({super.key, required this.id});
  TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          width: 148,
          text: 'BAYAR SEKARANG',
          onTap: () {
            Get.toNamed(TransaksiKonfirmasiBayar.routeName,
                arguments: transaction.id);
          },
        ),
        AppNegoButton(
          text: 'Nego',
          isActive: true,
        ),
        AppChatContainer()
      ],
    );
  }
}
