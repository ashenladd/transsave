import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/pages/transaction/seller/transaksi_seller.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/auth/AppTextField.dart';
import 'package:transsave/widgets/transaction_seller/AppRectangleSeller.dart';
import 'package:transsave/widgets/transaction_seller/AppUploadContainer.dart';
import 'package:transsave/widgets/CustomAppBar.dart';

import '../../../themes/color.dart';
import '../../../themes/fonts.dart';

class BuatTransaksi extends StatefulWidget {
  static String routeName = '/buat_transaksi';
  const BuatTransaksi({super.key});

  @override
  State<BuatTransaksi> createState() => _BuatTransaksiState();
}

class _BuatTransaksiState extends State<BuatTransaksi> {
  String? _dropdownValue = 'Fisik';
  bool isNego = false;

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
        appBar: CustomAppBar(
          title: "Buat Transaksi",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kategori',
                    style: mainStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10) //<-- SEE HERE
                        ),
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('Digital'),
                          value: 'Digital',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('Fisik'),
                          value: 'Fisik',
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
                    height: 25,
                  ),
                  Text(
                    'Nama Barang',
                    style: mainStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppTextField(
                    hintText: 'Masukkan Nama Barang',
                    useMargin: false,
                    isExpanded: true,
                    hintStyle: subtitleStyle2,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Keterangan',
                    style: mainStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppTextField(
                    height: 90,
                    hintText: 'Masukkan keterangan',
                    useMargin: false,
                    isExpanded: true,
                    hintStyle: subtitleStyle2,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Harga',
                    style: mainStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          useMargin: false,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 30,
                              child: Checkbox(
                                  value: isNego,
                                  onChanged: (value) {
                                    setState(() {
                                      isNego = !isNego;
                                    });
                                  }),
                            ),
                            Text(
                              'Fitur Nego Harga',
                              style:
                                  subtitleStyle2.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ongkos Kirim',
                              style: mainStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppTextField(
                              useMargin: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Berat',
                              style: mainStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppTextField(
                              useMargin: false,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gambar Barang',
                    style: mainStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AppUploadContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: AppButton(
                      text: "BUAT Transaksi",
                      onTap: () => Get.toNamed(TransaksiSeller.routeName),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
