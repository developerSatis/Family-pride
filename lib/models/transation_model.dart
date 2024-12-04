// To parse this JSON data, do
//
//     final transationModel = transationModelFromJson(jsonString);

import 'dart:convert';

TransationModel transationModelFromJson(String str) =>
    TransationModel.fromJson(json.decode(str));

String transationModelToJson(TransationModel data) =>
    json.encode(data.toJson());

class TransationModel {
  final int id;
  final String userId;
  final String orderId;
  final DateTime date;
  final String amount;
  final String paymentMethod;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Order order;

  TransationModel({
    required this.id,
    required this.userId,
    required this.orderId,
    required this.date,
    required this.amount,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.order,
  });

  factory TransationModel.fromJson(Map<String, dynamic> json) =>
      TransationModel(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        date: DateTime.parse(json["date"]),
        amount: json["amount"],
        paymentMethod: json["payment_method"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "date": date.toIso8601String(),
        "amount": amount,
        "payment_method": paymentMethod,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "order": order.toJson(),
      };
}

class Order {
  final String deliveryCharge;
  final String packingCharge;
  final String subtotal;
  final String couponType;
  final int discount;

  Order({
    required this.deliveryCharge,
    required this.packingCharge,
    required this.subtotal,
    required this.couponType,
    required this.discount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        deliveryCharge: json["delivery_charge"] ?? "0",
        packingCharge: json["packing_charge"] ?? "0",
        subtotal: json["subtotal"] ?? "0",
        couponType: json["coupon_type"] ?? '',
        discount: json["discount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "delivery_charge": deliveryCharge,
        "packing_charge": packingCharge,
        "subtotal": subtotal,
        "coupon_type": couponType,
        "discount": discount,
      };
}
