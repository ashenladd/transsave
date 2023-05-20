import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTransactionStep extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;
  final bool isTransactionSuccess;

  const AppTransactionStep(
      {super.key,
      required this.isJoin,
      required this.isPaid,
      required this.isDoneProcessed,
      required this.isSent,
      required this.isSentSuccess,
      required this.isTransactionSuccess});

  Widget getStep() {
    if (!isJoin) {
      return SvgPicture.asset('assets/transaction/belum_join.svg');
    } else if (isJoin && !isPaid) {
      return SvgPicture.asset('assets/transaction/join.svg');
    } else if (isJoin && isPaid && !isDoneProcessed) {
      return SvgPicture.asset('assets/transaction/dibayar.svg');
    } else if (isJoin && isPaid && isDoneProcessed && !isSent) {
      return SvgPicture.asset('assets/transaction/diproses.svg');
    } else if (isJoin &&
        isPaid &&
        isDoneProcessed &&
        isSent &&
        !isSentSuccess) {
      return SvgPicture.asset('assets/transaction/dikirim.svg');
    } else if (isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess) {
      return SvgPicture.asset('assets/transaction/selesai.svg');
    }
    return SvgPicture.asset('assets/transaction/belum_join.svg');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: getStep());
  }
}
