import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerSecond.dart';
import 'package:transsave/widgets/transaction_buyer/AppDetailBayar.dart';
import 'package:transsave/widgets/transaction_buyer/AppKeteranganContainerBuyer.dart';

class AppBottomsideBuyer extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isThereNego;
  // final bool isNegoAccepted;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;
  final Transaction transaction;
  final Nego nego;

  const AppBottomsideBuyer(
      {super.key, required this.transaction, required this.nego});

  Widget getContent() {
    if (transaction.status == Status.join && nego == Nego.negoAccepted) {
      return AppKeteranganContainerBuyer(id: transaction.id);
    } else if (transaction.status == Status.join && nego == Nego.notNego) {
      return AppKeteranganContainerBuyer(id: transaction.id);
    } else if (transaction.status == Status.paid) {
      return AppDetailBayar();
    } else if (transaction.status == Status.doneProcessed) {
      return AppDetailBayar();
    } else if (transaction.status == Status.sent) {
      return AppDarkContainerSecond();
    } else if (transaction.status == Status.sentSuccess) {
      return AppKeteranganContainerBuyer(id: transaction.id);
    }
    return AppKeteranganContainerBuyer(id: transaction.id);
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
