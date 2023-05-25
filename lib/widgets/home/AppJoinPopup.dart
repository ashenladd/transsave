import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_konfirmasi_join.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

import '../../controller/TransactionController.dart';
import '../auth/AppTextField.dart';

class AppJoinPopup extends StatefulWidget {
  const AppJoinPopup({super.key});

  @override
  State<AppJoinPopup> createState() => _AppJoinPopupState();
}

class _AppJoinPopupState extends State<AppJoinPopup> {
  final TransactionController transactionController =
      Get.find<TransactionController>();
  TextEditingController _kodeJoinController = TextEditingController();
  String? codeDialog;
  String? valueText;
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      try {
        Transaction transaction = transactionController
            .getTransactionByRoomId(int.parse(_kodeJoinController.text));

        Get.toNamed(TransaksiKonfirmasiJoin.routeName,
            arguments: transaction.id);
      } catch (e) {
        Get.snackbar('Kode Join Salah', 'Kode Join tidak ditemukan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomAppBar(
        title: 'Join Transaksi',
        leading: Icon(Icons.close),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value!.isEmpty ? 'Kode Join tidak boleh kosong' : null,
                  useMargin: false,
                  controller: _kodeJoinController,
                ),
                SizedBox(
                  height: 26,
                ),
                AppButton(
                  text: 'KONFIRMASI',
                  onTap: () => submit(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
