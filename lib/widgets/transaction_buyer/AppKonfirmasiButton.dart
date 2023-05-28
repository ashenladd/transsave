import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppKonfirmasiButton extends StatelessWidget {
  final String id;
  AppKonfirmasiButton({super.key, required this.id});
  TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          width: 234,
          text: 'KONFIRMASI',
          onTap: () {
            transactionController.updateTransactionStatus(
                transaction.id, Status.sentSuccess);
          },
        ),
        AppChatContainer()
      ],
    );
  }
}

class TransaksiKonfirmasiBayar {}
