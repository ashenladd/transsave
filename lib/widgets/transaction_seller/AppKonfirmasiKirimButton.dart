import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/transaction/seller/transaksi_konfirmasi_kirim.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppKonfirmsiKirimButton extends StatelessWidget {
  final String id;

  AppKonfirmsiKirimButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          text: 'KONFIRMASI KIRIM',
          width: 233,
          onTap: () {
            Get.toNamed(TransaksiKonfirmasiKirim.routeName, arguments: id);
          },
        ),
        const AppChatContainer(
          isActive: true,
        )
      ],
    );
    ;
  }
}
