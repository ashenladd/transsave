import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDetailBuyer.dart';

class AppUppersideBuyer extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;
  final bool isNegoAccepted;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;

  const AppUppersideBuyer({
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
      return AppDarkContainerBuyer();
    } else if (isJoin && !isPaid && !isThereNego) {
      return AppDarkContainerBuyer();
    } else if (isJoin && isPaid && !isDoneProcessed) {
      return AppDarkContainerBuyer();
    } else if (isJoin && isPaid && isDoneProcessed && !isSent) {
      return AppDarkContainerBuyer();
    } else if (isJoin &&
        isPaid &&
        isDoneProcessed &&
        isSent &&
        !isSentSuccess) {
      return AppDetailBuyer();
    } else if (isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess) {
      return AppDarkContainerBuyer();
    }
    return AppDarkContainerBuyer();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
