import 'package:get/get.dart';

import '../model/UserModel.dart';

class UserController extends GetxController {
  User? _user;
  User? get user => _user;

  @override
  void onInit() {
    super.onInit();
    setUser();
  }

  void setUser() {
    _user = user;
    update();
  }

  //method add user
  void addUser(User user) {
    _user = user;
    update();
  }
}
