import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

class Transaction {
  String id;
  int productId;
  int tax;
  int shipping_fee;
  bool negotiable;
  Status status;
  String statusString;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;
  Room room;

  Transaction({
    required this.id,
    required this.productId,
    required this.tax,
    required this.shipping_fee,
    required this.negotiable,
    required this.status,
    required this.statusString,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    required this.room,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      productId: json["product_id"],
      tax: json["tax"].toInt(),
      shipping_fee: json['shipping_fee'],
      negotiable: json["negotiable"],
      status: json["status"] != null
          ? Status.fromJson(json["status"])
          : Status.notJoin,
      statusString: json["status"] != null ? json["status"] : 'NOT_JOIN',
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      product: Product.fromJson(json["product"]),
      room:
          Room.fromJson(json["room"] is List ? json["room"][0] : json["room"]),
    );
  }
}
