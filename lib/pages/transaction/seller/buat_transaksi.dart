import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _ongkosKirimController = TextEditingController();
  String? _dropdownValue = 'Fisik';
  bool isNego = false;

  void submit() {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      Product product = Product(
          id: DateTime.now().microsecondsSinceEpoch,
          name: _nameController.text,
          price: int.parse(_priceController.text),
          category: Category.fromString(_dropdownValue!),
          desc: _descController.text,
          images: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      Room room = Room(
          id: DateTime.now().microsecondsSinceEpoch,
          sellerId: DateTime.now().microsecondsSinceEpoch,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      Transaction transaction = Transaction(
          id: DateTime.now().microsecondsSinceEpoch,
          productId: product.id,
          roomId: room.id,
          tax: 10000,
          negotiable: isNego ? true : false,
          status: Status.notJoin,
          statusString: 'NOT JOIN',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          product: product,
          room: room);

      print('Form is valid');
      productController.addProduct(product);
      roomController.addRoom(room);
      transactionController.addTransaction(transaction);
      Get.toNamed(TransaksiSeller.routeName, arguments: transaction.id);
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
                        onTap: () => submit(),
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
