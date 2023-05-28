import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/main_screen/main_page.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppBerikanRatingButton extends StatelessWidget {
  final String id;
  TransactionController transactionController =
      Get.find<TransactionController>();
  AppBerikanRatingButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        text: 'BERIKAN RATING',
        width: 275,
        onTap: () {
          transactionController.updateTransactionStatus(id, Status.sent);
          Get.offAllNamed(MainPage.routeName);
        },
      ),
    );
    ;
  }
}
