// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) =>
    OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  final int id;
  final String orderId;
  final dynamic discount;
  final dynamic discountType;
  final String subtotal;
  final String deliveryCharge;
  final String packingCharge;
  final DateTime orderDate;
  final String total;
  final String paymentMethod;
  final String orderStatus;
  final String paymentStatus;
  final dynamic currentView;
  final String createdAt;

  OrderListModel({
    required this.id,
    required this.orderId,
    required this.discount,
    required this.discountType,
    required this.subtotal,
    required this.deliveryCharge,
    required this.packingCharge,
    required this.orderDate,
    required this.total,
    required this.paymentMethod,
    required this.orderStatus,
    required this.paymentStatus,
    required this.currentView,
    required this.createdAt,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        id: json["id"],
        orderId: json["order_id"],
        discount: json["discount"],
        discountType: json["discount_type"],
        subtotal: json["subtotal"],
        deliveryCharge: json["delivery_charge"],
        packingCharge: json["packing_charge"],
        orderDate: DateTime.parse(json["order_date"]),
        total: json["total"],
        paymentMethod: json["payment_method"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        currentView: json["current_view"] != null
            ? DateTime.parse(json["current_view"])
            : DateTime.now(),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "discount": discount,
        "discount_type": discountType,
        "subtotal": subtotal,
        "delivery_charge": deliveryCharge,
        "packing_charge": packingCharge,
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "total": total,
        "payment_method": paymentMethod,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "current_view": currentView?.toIso8601String(),
        "created_at": createdAt,
      };
}
