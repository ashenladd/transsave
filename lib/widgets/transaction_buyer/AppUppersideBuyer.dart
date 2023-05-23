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

  final Status status;
  final Nego nego;

  const AppUppersideBuyer({
    super.key,
    required this.status,
    required this.nego,
  });

  Widget getContent() {
    if (status == Status.join && nego == Nego.negoAccepted) {
      return AppDarkContainerBuyer();
    } else if (status == Status.join && nego == Nego.notNego) {
      return AppDarkContainerBuyer();
    } else if (status == Status.paid) {
      return AppDarkContainerBuyer();
    } else if (status == Status.doneProcessed) {
      return AppDarkContainerBuyer();
    } else if (status == Status.sent) {
      return AppDetailBuyer();
    } else if (status == Status.sentSuccess) {
      return AppDarkContainerBuyer();
    }
    return AppDarkContainerBuyer();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
