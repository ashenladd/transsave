import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:transsave/model/ProductModel.dart';

import 'RoomModel.dart';

enum Status {
  notJoin,
  join,
  paid,
  doneProcessed,
  sent,
  sentSuccess,
  dibatalkan;

  factory Status.fromJson(String str) {
    if (str == 'JOIN') {
      return Status.join;
    } else if (str == 'DIBAYAR') {
      return Status.paid;
    } else if (str == 'DIPROSES') {
      return Status.doneProcessed;
    } else if (str == 'DIKIRIM') {
      return Status.sent;
    } else if (str == 'SELESAI') {
      return Status.sentSuccess;
    } else if (str == 'DIBATALKAN') {
      return Status.dibatalkan;
    } else {
      return Status.notJoin;
    }
  }
}

enum Nego { notNego, nego, negoAccepted, negoRejected }

// To parse this JSON data, do
//
//     final createTransactionModel = createTransactionModelFromJson(jsonString);

// CreateTransactionModel createTransactionModelFromJson(String str) =>
//     CreateTransactionModel.fromJson(json.decode(str));

// String createTransactionModelToJson(CreateTransactionModel data) =>
//     json.encode(data.toJson());

class Transaction {
  int id;
  int productId;
  String roomId;
  int tax;
  bool negotiable;
  Status status;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;
  Room room;

  Transaction({
    required this.id,
    required this.productId,
    required this.roomId,
    required this.tax,
    required this.negotiable,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    required this.room,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        productId: json["product_id"],
        roomId: json["room_id"],
        tax: json["tax"].toInt(),
        negotiable: json["negotiable"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        product: Product.fromJson(json["product"]),
        room: Room.fromJson(json["room"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "room_id": roomId,
        "tax": tax,
        "negotiable": negotiable,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "product": product.toJson(),
        "room": room.toJson(),
      };
}

//Create 7 dummyTransaction
List<Transaction> dummyTransaction = [
  Transaction(
    id: 1,
    productId: 1,
    roomId: '1',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[0],
    room: dummyRoom[0],
  ),
  Transaction(
    id: 2,
    productId: 2,
    roomId: '2',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[1],
    room: dummyRoom[1],
  ),
  Transaction(
    id: 3,
    productId: 3,
    roomId: '3',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[2],
    room: dummyRoom[2],
  ),
  Transaction(
    id: 4,
    productId: 4,
    roomId: '4',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[3],
    room: dummyRoom[3],
  ),
  Transaction(
    id: 5,
    productId: 5,
    roomId: '5',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[4],
    room: dummyRoom[4],
  ),
  Transaction(
    id: 6,
    productId: 6,
    roomId: '6',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[5],
    room: dummyRoom[5],
  ),
  Transaction(
    id: 7,
    productId: 7,
    roomId: '7',
    tax: 10000,
    negotiable: true,
    status: Status.join,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    product: dummyProduct[6],
    room: dummyRoom[6],
  ),
];
