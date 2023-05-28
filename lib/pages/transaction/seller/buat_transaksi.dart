import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/ImageController.dart';
import 'package:transsave/controller/ProductController.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/transaction/seller/transaksi_seller.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/auth/AppTextField.dart';
import 'package:transsave/widgets/transaction_seller/AppRectangleSeller.dart';
import 'package:transsave/widgets/transaction_seller/AppUploadContainer.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'dart:math';

import '../../../controller/RoomController.dart';
import '../../../model/ProductModel.dart';
import '../../../model/RoomModel.dart';
import '../../../themes/color.dart';
import '../../../themes/fonts.dart';

class BuatTransaksi extends StatefulWidget {
  static String routeName = '/buat_transaksi';
  const BuatTransaksi({super.key});

  @override
  State<BuatTransaksi> createState() => _BuatTransaksiState();
}

class _BuatTransaksiState extends State<BuatTransaksi> {
  final _formKey = GlobalKey<FormState>();
  final TransactionController transactionController =
      Get.find<TransactionController>();
  final ProductController productController = Get.find<ProductController>();
  final RoomController roomController = Get.find<RoomController>();
  final ImageController imageController = Get.put(ImageController());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _ongkosKirimController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  String? _dropdownValue = 'Fisik';
  bool isNego = false;

  void submit() async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      print(imageController.image);
      Map<String, dynamic> data = {
        'category': _dropdownValue?.toLowerCase(),
        'name': _nameController.text,
        'desc': _descController.text,
        'price': _priceController.text,
        'images': imageController.image,
        'negotiable': isNego ? 'true' : 'false',
        'shipping_fee': int.parse(_ongkosKirimController.text),
        'weight': int.parse(_beratController.text),
        'tax': 2500,
      };
      try {
        Transaction transaction =
            await transactionController.addTransaction(data);

        await Get.offNamed(TransaksiSeller.routeName,
            arguments: transaction.id);
      } catch (e) {
        Get.snackbar('$e', 'Coba Lagi');
      }
    } else {
      print('Form is invalid');
    }
  }

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
          title: "Buat Transaksi",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formKey,
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
                          color: Color(0xFFF9F9F9),
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
                      controller: _nameController,
                      validator: (value) => value!.isEmpty
                          ? 'Nama Barang tidak boleh kosong'
                          : null,
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
                      controller: _descController,
                      validator: (value) => value!.isEmpty
                          ? 'Keterangan tidak boleh kosong'
                          : null,
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
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            validator: (value) => value!.isEmpty
                                ? 'Harga tidak boleh kosong'
                                : null,
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
                                style: subtitleStyle2.copyWith(
                                    color: Colors.black),
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
                                controller: _ongkosKirimController,
                                keyboardType: TextInputType.number,
                                validator: (value) => value!.isEmpty
                                    ? 'Ongkos Kirim tidak boleh kosong'
                                    : null,
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
                                controller: _beratController,
                                keyboardType: TextInputType.number,
                                validator: (value) => value!.isEmpty
                                    ? 'Berat tidak boleh kosong'
                                    : null,
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
                        onTap: () {
                          submit();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
