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
  String images;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.desc,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"].toInt(),
        category: json["category"],
        desc: json["desc"],
        images: json["images"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category": category,
        "desc": desc,
        "images": images,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

//Create 7 dummyProduct with different category and price
List<Product> dummyProduct = [
  Product(
    id: 1,
    name: 'Kaos',
    price: 100000,
    category: Category.Fisik,
    desc: 'Kaos ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 2,
    name: 'Kemeja',
    price: 200000,
    category: Category.Fisik,
    desc: 'Kemeja ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 3,
    name: 'Celana',
    price: 300000,
    category: Category.Fisik,
    desc: 'Celana ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 4,
    name: 'Sepatu',
    price: 400000,
    category: Category.Fisik,
    desc: 'Sepatu ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 5,
    name: 'Kaos',
    price: 500000,
    category: Category.Fisik,
    desc: 'Kaos ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 6,
    name: 'Kaos',
    price: 600000,
    category: Category.Fisik,
    desc: 'Kaos ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 7,
    name: 'Kaos',
    price: 700000,
    category: Category.Fisik,
    desc: 'Kaos ini sangat bagus',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
