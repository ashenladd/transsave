import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppProsesPesananButton extends StatelessWidget {
  final String id;
  TransactionController transactionController =
      Get.find<TransactionController>();
  AppProsesPesananButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          text: 'PROSES PESANAN',
          width: 233,
          onTap: () {
            transactionController.updateTransactionStatus(
                id, Status.doneProcessed);
          },
        ),
        const AppChatContainer(
          isActive: true,
        )
      ],
    );
    ;
  }
}
