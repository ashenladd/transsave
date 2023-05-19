import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/themes/fonts.dart';

class AppTileItem extends StatelessWidget {
  AppTileItem({super.key});

  final Map dummyBarang = {
    'kategori': 'Fisik',
    'name': 'Poco F4 6/128 Hitam ',
    'harga': 2500000,
    'img': 'assets/transaction/dummy_barang.png'
  };

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage(dummyBarang['img']),
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
                        dummyBarang['kategori'],
                        style: itemCategoryStyle,
                      ),
                      Text(
                        dummyBarang['name'],
                        style: itemTitleStyle,
                      ),
                      Text(
                        "Rp. ${dummyBarang['harga'].toString()}",
                        style: itemPriceStyle,
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 110,
            height: 20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    4,
                    (index) => Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(dummyBarang['img']),
                                  fit: BoxFit.cover)),
                        ))),
          )
        ],
      ),
    );
  }
}
