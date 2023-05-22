import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_konfirmasi_join.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

import '../auth/AppTextField.dart';

class AppJoinPopup extends StatefulWidget {
  const AppJoinPopup({super.key});

  @override
  State<AppJoinPopup> createState() => _AppJoinPopupState();
}

class _AppJoinPopupState extends State<AppJoinPopup> {
  TextEditingController _textFieldController = TextEditingController();
  String? codeDialog;
  String? valueText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomAppBar(
        title: 'Join Transaksi',
        leading: Icon(Icons.close),
      ),
      content: Container(
        height: 300,
        child: Column(
          children: [
            SvgPicture.asset('assets/transaction_konfirmasi_join/join.svg'),
            SizedBox(
              height: 22,
            ),
            Text(
              'Masukkan Kode Join',
              style: subtitleStyle2.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            AppTextField(
              useMargin: false,
              controller: _textFieldController,
            ),
            SizedBox(
              height: 26,
            ),
            AppButton(
              text: 'KONFIRMASI',
              onTap: () => Get.toNamed(TransaksiKonfirmasiJoin.routeName),
            )
          ],
        ),
      ),
    );
  }
}
