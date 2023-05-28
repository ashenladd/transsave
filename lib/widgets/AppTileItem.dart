import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/constant/api.dart';
import 'package:transsave/controller/ProductController.dart';
import 'package:transsave/controller/TransactionController.dart';
import 'package:transsave/model/ProductModel.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/themes/fonts.dart';

class AppTileItem extends StatelessWidget {
  TransactionController transactionController =
      Get.find<TransactionController>();
  final String id;
  AppTileItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Transaction transaction = transactionController.getTransactionById(id);
    return Container(
      width: 325,
      height: 126,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${APIService.image + transaction.product.images!}'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                  width: 202,
                  height: 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${transaction.product.category == Category.Fisik ? "Fisik" : "Digital"}',
                        style: itemCategoryStyle,
                      ),
                      Text(
                        '${transaction.product.name}',
                        style: itemTitleStyle,
                      ),
                      Text(
                        "Rp ${transaction.product.price}",
                        style: itemPriceStyle,
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
