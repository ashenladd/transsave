import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:transsave/controller/ProductController.dart';
import 'package:transsave/model/ProductModel.dart';
import 'package:transsave/themes/fonts.dart';

class AppTileItem extends StatelessWidget {
  ProductController productController = Get.find<ProductController>();
  final int id;
  AppTileItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Product product = productController.getProductById(id);
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
                        image: NetworkImage('${product.images}'),
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
                        '${product.category == Category.Fisik ? "Fisik" : "Digital"}',
                        style: itemCategoryStyle,
                      ),
                      Text(
                        '${product.name}',
                        style: itemTitleStyle,
                      ),
                      Text(
                        "Rp ${product.price}",
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
                                  image: NetworkImage('${product.images}'),
                                  fit: BoxFit.cover)),
                        ))),
          )
        ],
      ),
    );
  }
}
