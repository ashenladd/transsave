import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerSecond.dart';
import 'package:transsave/widgets/transaction_buyer/AppDetailBayar.dart';
import 'package:transsave/widgets/transaction_buyer/AppKeteranganContainerBuyer.dart';

class AppBottomsideBuyer extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;
  final bool isNegoAccepted;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;

  const AppBottomsideBuyer({
    super.key,
    required this.isJoin,
    required this.isPaid,
    required this.isThereNego,
    required this.isNegoAccepted,
    required this.isDoneProcessed,
    required this.isSent,
    required this.isSentSuccess,
  });

  Widget getContent() {
    if (isJoin && !isPaid && !isThereNego && isNegoAccepted) {
      return AppKeteranganContainerBuyer();
    } else if (isJoin && !isPaid && !isThereNego) {
      return AppKeteranganContainerBuyer();
    } else if (isJoin && isPaid && !isDoneProcessed) {
      return AppDetailBayar();
    } else if (isJoin && isPaid && isDoneProcessed && !isSent) {
      return AppDetailBayar();
    } else if (isJoin &&
        isPaid &&
        isDoneProcessed &&
        isSent &&
        !isSentSuccess) {
      return AppDarkContainerSecond();
    } else if (isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess) {
      return AppKeteranganContainerBuyer();
    }
    return AppKeteranganContainerBuyer();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
