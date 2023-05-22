import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/auth/AppTextField.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppDetailBuyer.dart';
import 'package:transsave/widgets/transaction_buyer/AppKeteranganContainerBuyer.dart';
import 'package:transsave/widgets/transaction_seller/AppDetailSeller.dart';

import '../../../themes/color.dart';
import '../../../themes/fonts.dart';

class TransaksiKonfirmasiBayar extends StatefulWidget {
  static String routeName = '/transaksi_konfirmasi_bayar';
  const TransaksiKonfirmasiBayar({super.key});

  @override
  State<TransaksiKonfirmasiBayar> createState() =>
      _TransaksiKonfirmasiBayarState();
}

class _TransaksiKonfirmasiBayarState extends State<TransaksiKonfirmasiBayar> {
  final TextEditingController _catatanController = TextEditingController();
  String? _dropdownValue = 'Dana';

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Detail Pembayaran',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                    'assets/transaction_konfirmasi_bayar/konfirmasi_bayar.svg'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alamat Pengiriman',
                    style: mainStyle,
                  ),
                  Text(
                    'Ganti Alamat',
                    style: textButtonStyle,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              AppDetailBuyer(
                isConfirmPaymentPage: true,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Catatan',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              AppTextField(
                controller: _catatanController,
                height: 80,
                isExpanded: true,
                useMargin: false,
                hintText: 'Tulis catatan untuk penjual',
                hintStyle: subtitleStyle2.copyWith(color: Colors.grey),
                maxLines: 3,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Metode Pembayaran',
                style: mainStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(10) //<-- SEE HERE
                    ),
                child: DropdownButton(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Dana'),
                      value: 'Dana',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Virtual Account'),
                      value: 'Virtual Account',
                    ),
                  ],
                  value: _dropdownValue,
                  onChanged: dropdownCallback,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.grey,
                  ),
                  underline: SizedBox(),
                  style: subtitleStyle2,
                  dropdownColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.backgroundColor3,
                ),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga:',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Rp. 2.300.000',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ongkos Kirim:',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Rp. 15.000',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Admin:',
                        style: subtitleStyle2.copyWith(
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Text(
                        'Rp 2500',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xFFE2E9EB),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total :',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Rp. 2.317.500',
                        style: subtitleStyle2.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: AppButton(
                text: 'BAYAR SEKARANG',
              ))
            ],
          ),
        ),
      )),
    );
  }
}
