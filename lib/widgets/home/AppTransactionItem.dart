import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/themes/color.dart';
import 'package:transsave/themes/fonts.dart';

class AppTransactionItem extends StatelessWidget {
  final Transaction transaction;

  AppTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      width: 140,
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.mainRed.withOpacity(0.5)),
                child: Icon(
                  Icons.sell,
                  size: 15,
                  color: AppColor.mainRed,
                ),
              ),
              Text(
                'Jual',
                style: subtitleStyle.copyWith(color: Colors.black),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            transaction.product.name,
            style: subtitleStyle2,
          ),
          Text(
            'Rp ${transaction.product.price}',
            style: mainStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${transaction.statusString}',
                style: subtitleStyle2.copyWith(color: AppColor.mainRed),
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColor.mainRed,
              )
            ],
          )
        ],
      ),
    );
  }
}
