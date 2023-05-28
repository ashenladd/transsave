import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppNegoButton.dart';
import 'package:transsave/widgets/transaction_seller/AppBagikanKodeButton.dart';
import 'package:transsave/widgets/transaction_seller/AppBerikanRatingButton.dart';
import 'package:transsave/widgets/transaction_seller/AppChatPembeliButton.dart';
import 'package:transsave/widgets/transaction_seller/AppKonfirmasiKirimButton.dart';
import 'package:transsave/widgets/transaction_seller/AppProsesPesananButton.dart';

class AppLowerSide extends StatelessWidget {
  final Transaction transaction;
  final Nego nego;
  const AppLowerSide(
      {super.key, required this.transaction, required this.nego});

  Widget getContent() {
    if (transaction.status == Status.paid) {
      return AppProsesPesananButton(id: transaction.id);
    } else if (transaction.status == Status.doneProcessed) {
      return AppKonfirmsiKirimButton(id: transaction.id);
    } else if (transaction.status == Status.sent) {
      return AppChatPembeliButton();
    } else if (transaction.status == Status.sentSuccess) {
      return AppBerikanRatingButton(id: transaction.id);
    } else if (transaction.status == Status.join && nego == Nego.nego) {
      return AppNegoButton();
    }
    return AppBagikanKodeButton();
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
