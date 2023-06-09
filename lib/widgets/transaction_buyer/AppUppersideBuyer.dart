import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDetailBuyer.dart';

import '../../model/TransactionModel.dart';

class AppUppersideBuyer extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isThereNego;
  // final bool isNegoAccepted;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;

  final Transaction transaction;
  final Nego nego;

  const AppUppersideBuyer({
    super.key,
    required this.transaction,
    required this.nego,
  });

  Widget getContent() {
    if (transaction.status == Status.join && nego == Nego.negoAccepted) {
      return AppDarkContainerBuyer(
        transaction: transaction,
      );
    } else if (transaction.status == Status.join && nego == Nego.notNego) {
      return AppDarkContainerBuyer(
        transaction: transaction,
      );
    } else if (transaction.status == Status.paid) {
      return AppDarkContainerBuyer(
        transaction: transaction,
      );
    } else if (transaction.status == Status.doneProcessed) {
      return AppDarkContainerBuyer(
        transaction: transaction,
      );
    } else if (transaction.status == Status.sent) {
      return AppDetailBuyer();
    } else if (transaction.status == Status.sentSuccess) {
      return AppDarkContainerBuyer(
        transaction: transaction,
      );
    }
    return AppDarkContainerBuyer(
      transaction: transaction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
