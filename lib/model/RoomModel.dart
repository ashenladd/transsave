class Room {
  String id;
  int sellerId;
  int? buyerId;
  DateTime createdAt;
  DateTime updatedAt;

  Room({
    required this.id,
    required this.sellerId,
    this.buyerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        sellerId: json["seller_id"],
        buyerId: json["buyer_id"].toInt(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "buyer_id": buyerId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

//Create 7 dummyRoom
List<Room> dummyRoom = [
  Room(
    id: '1',
    sellerId: 1,
    buyerId: 2,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '2',
    sellerId: 1,
    buyerId: 3,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '3',
    sellerId: 1,
    buyerId: 4,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '4',
    sellerId: 1,
    buyerId: 5,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '5',
    sellerId: 1,
    buyerId: 6,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '6',
    sellerId: 1,
    buyerId: 7,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
  Room(
    id: '7',
    sellerId: 1,
    buyerId: 8,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];
