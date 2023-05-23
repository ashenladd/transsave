import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/TransactionModel.dart';

class AppTransactionStep extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;
  final Status status;

  const AppTransactionStep({
    super.key,
    required this.status,
  });

  Widget getStep() {
    if (status == Status.join) {
      return SvgPicture.asset('assets/transaction/join.svg');
    } else if (status == Status.paid) {
      return SvgPicture.asset('assets/transaction/dibayar.svg');
    } else if (status == Status.doneProcessed) {
      return SvgPicture.asset('assets/transaction/diproses.svg');
    } else if (status == Status.sent) {
      return SvgPicture.asset('assets/transaction/dikirim.svg');
    } else if (status == Status.sentSuccess) {
      return SvgPicture.asset('assets/transaction/selesai.svg');
    }
    return SvgPicture.asset('assets/transaction/belum_join.svg');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: getStep());
  }
}
