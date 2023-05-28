import 'package:get/get.dart';

import '../model/ProductModel.dart';

class ProductController extends GetxController {
  List<Product> _products = [];
  List<Product> get allProducts => _products;

  @override
  void onInit() {
    super.onInit();
    setProducts();
  }

  //Ganti dengan API
  void setProducts() {
    update();
  }

  //Method add product
  void addProduct(Product product) {
    _products.add(product);
    update();
  }

  //Method get product by id
  Product getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }

  //Method get image
  String? getImage(int id) {
    return _products.firstWhere((product) => product.id == id).images;
  }

  //Method update image
  void updateImage(int id, String image) {
    _products.firstWhere((product) => product.id == id).images = image;
    update();
  }
}
