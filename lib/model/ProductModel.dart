enum Category {
  Fisik,
  Digital;

  factory Category.fromJson(String json) {
    switch (json) {
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

//Create 7 dummyProduct
List<Product> dummyProduct = [
  Product(
    id: 1,
    name: 'Kaos',
    price: 10000,
    category: Category.Fisik,
    desc: 'Kaos',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 2,
    name: 'Celana',
    price: 10000,
    category: Category.Fisik,
    desc: 'Celana',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 3,
    name: 'Sepatu',
    price: 10000,
    category: Category.Fisik,
    desc: 'Sepatu',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 4,
    name: 'Jaket',
    price: 10000,
    category: Category.Fisik,
    desc: 'Jaket',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 5,
    name: 'Tas',
    price: 10000,
    category: Category.Fisik,
    desc: 'Tas',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 6,
    name: 'Dompet',
    price: 10000,
    category: Category.Fisik,
    desc: 'Dompet',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Product(
    id: 7,
    name: 'Topi',
    price: 10000,
    category: Category.Fisik,
    desc: 'Topi',
    images: 'https://picsum.photos/200',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
