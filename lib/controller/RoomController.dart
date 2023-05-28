import 'package:get/get.dart';

import '../model/RoomModel.dart';

class RoomController extends GetxController {
  List<Room> _rooms = [];
  List<Room> get allRooms => _rooms;

  @override
  void onInit() {
    super.onInit();
    setRooms();
  }

  //Ganti dengan API
  void setRooms() {
    update();
  }

  //Method add room
  void addRoom(Room room) {
    _rooms.add(room);
    update();
  }
}
