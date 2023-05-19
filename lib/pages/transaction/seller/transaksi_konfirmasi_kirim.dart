import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transsave/themes/fonts.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/auth/AppTextField.dart';
import 'package:transsave/widgets/transaction/AppUploadContainer.dart';
import 'package:transsave/widgets/transaction/CustomAppBar.dart';

class TransaksiKonfirmasiKirim extends StatefulWidget {
  const TransaksiKonfirmasiKirim({super.key});

  @override
  State<TransaksiKonfirmasiKirim> createState() =>
      _TransaksiKonfirmasiKirimState();
}

class _TransaksiKonfirmasiKirimState extends State<TransaksiKonfirmasiKirim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Konfirmasi Pengiriman',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/transaction_konfirmasi_kirim/sent.svg'),
              Text(
                'Jasa/Cara Pengiriman',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              AppTextField(
                useMargin: false,
                isExpanded: true,
                hintText: 'Masukkan Nama Ekspedisi/Cara Pengiriman',
                hintStyle: subtitleStyle2,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Resi',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              AppTextField(
                useMargin: false,
                isExpanded: true,
                hintText: 'Masukkan Nomor Resi',
                hintStyle: subtitleStyle2,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Keterangan',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              AppTextField(
                useMargin: false,
                isExpanded: true,
                hintText: 'Keterangan',
                hintStyle: subtitleStyle2,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Bukti Pengiriman',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              AppUploadContainer(),
              SizedBox(
                height: 25,
              ),
              Center(
                child: AppButton(
                  text: 'Kirim Pesanan',
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}