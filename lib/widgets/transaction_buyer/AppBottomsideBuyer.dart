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
  final Status status;
  final Nego nego;

  const AppBottomsideBuyer(
      {super.key, required this.status, required this.nego});

  Widget getContent() {
    if (status == Status.join && nego == Nego.negoAccepted) {
      return AppKeteranganContainerBuyer();
    } else if (status == Status.join && nego == Nego.notNego) {
      return AppKeteranganContainerBuyer();
    } else if (status == Status.paid) {
      return AppDetailBayar();
    } else if (status == Status.doneProcessed) {
      return AppDetailBayar();
    } else if (status == Status.sent) {
      return AppDarkContainerSecond();
    } else if (status == Status.sentSuccess) {
      return AppKeteranganContainerBuyer();
    }
    return AppKeteranganContainerBuyer();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
