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
        buyerId: json["buyer_id"],
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
