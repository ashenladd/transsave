import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/themes/fonts.dart';

class AppHistoryTransactionItem extends StatelessWidget {
  const AppHistoryTransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.vcgamers.com/news/wp-content/uploads/2022/04/Diamond-Mobile-Legends.jpg'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '100 Diamond ML',
              style: subtitleStyle2.copyWith(color: Colors.black),
            ),
            Text(
              'Rp 50.000',
              style: mainStyle.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text(
              '20 Mei 2023',
              style: subtitleStyle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Transaksi Berhasil',
              style: subtitleStyle2.copyWith(
                  color: Color(0xFF3787FF), fontWeight: FontWeight.w500),
            )
          ],
        )
      ]),
    );
  }
}
