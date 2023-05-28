import 'dart:io';

import 'package:get/get.dart';

enum Category {
  Fisik,
  Digital;

  factory Category.fromString(String str) {
    switch (str.toLowerCase()) {
      case 'fisik':
        return Category.Fisik;
      case 'digital':
        return Category.Digital;
      default:
        return Category.Fisik;
    }
  }
}

class Product {
  int id;
  String name;
  int price;
  Category category;
  String desc;
  String? images;
  File? imageFile;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.desc,
    this.images,
    this.imageFile,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"].toInt(),
        category: Category.fromString(json["category"]),
        desc: json["desc"],
        images: json["images"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
