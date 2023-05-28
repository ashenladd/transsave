import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/widgets/transaction_buyer/AppBayarSekarangButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppChatPenjual.dart';
import 'package:transsave/widgets/transaction_buyer/AppKonfirmasiButton.dart';
import 'package:transsave/widgets/transaction_seller/AppBerikanRatingButton.dart';
import 'package:transsave/widgets/transaction_seller/AppChatPembeliButton.dart';

class AppButtonSide extends StatelessWidget {
  final Transaction transaction;
  const AppButtonSide({super.key, required this.transaction});

  Widget getContent() {
    if (transaction.status == Status.paid ||
        transaction.status == Status.doneProcessed) {
      return AppChatPembeliButton();
    } else if (transaction.status == Status.sent) {
      return AppKonfirmasiButton(id: transaction.id);
    } else if (transaction.status == Status.sentSuccess) {
      return AppBerikanRatingButton(id: transaction.id);
    }
    return AppBayarSekarangButton(
      id: transaction.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getContent();
  }
}
