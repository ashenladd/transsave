import 'dart:io';

import 'package:get/get.dart';

class ImageController extends GetxController {
  File? _image;
  File? get image => _image;

  //Metgod update image
  void updateImage(File image) {
    _image = image;
    update();
  }

  //Method get image
  File? getImage() {
    return _image;
  }
}
