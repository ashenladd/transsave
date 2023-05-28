import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/pages/transaction/buyer/transaksi_buyer.dart';
import 'package:transsave/widgets/CustomAppBar.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction_buyer/AppDarkContainerBuyer.dart';

import '../../../model/ProductModel.dart';
import '../../../themes/color.dart';
import '../../../themes/fonts.dart';

class TransaksiKonfirmasiJoin extends StatelessWidget {
  String argumen = Get.arguments;
  static String routeName = '/transaksi_konfirmasi_join';
  TransaksiKonfirmasiJoin({
    super.key,
  });

  void submit(Transaction transaction) {
    if (transaction.status == Status.notJoin) {
      transactionController.updateTransactionStatus(
          transaction.id, Status.join);
    }

    Get.toNamed(TransaksiBuyer.routeName, arguments: transaction.id);
  }

  TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(argumen);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor2,
      appBar: CustomAppBar(leading: Icon(Icons.close)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.backgroundColor3,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/transaction_buyer/buyer_konfirmasi.svg',
                        width: 108,
                        height: 108,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        "Konfirmasi Join",
                        style: titleStyle.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Color(0xFFE2E9EB),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Produk Dijual',
                            style: subtitleStyle2.copyWith(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          Text(
                            '${transaction.product.name}',
                            style: subtitleStyle2.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga',
                            style: subtitleStyle2.copyWith(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          Text(
                            'Rp. ${transaction.product.price}',
                            style: subtitleStyle2.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kategori',
                            style: subtitleStyle2.copyWith(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          Text(
                            '${transaction.product.category == Category.Fisik ? 'Fisik' : 'Digital'}',
                            style: subtitleStyle2.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dijual oleh',
                            style: subtitleStyle2.copyWith(
                                color: Colors.white.withOpacity(0.4)),
                          ),
                          Text(
                            'Ali Marapaung',
                            style: subtitleStyle2.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )),
              SizedBox(
                height: 65,
              ),
              AppButton(
                text: 'JOIN TRANSAKSI',
                width: 215,
                onTap: () => submit(transaction),
              )
            ],
          ),
        ),
      )),
    );
  }
}
