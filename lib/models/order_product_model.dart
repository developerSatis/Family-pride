// To parse this JSON data, do
//
//     final orderProductDetailsModel = orderProductDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderProductDetailsModel orderProductDetailsModelFromJson(String str) =>
    OrderProductDetailsModel.fromJson(json.decode(str));

String orderProductDetailsModelToJson(OrderProductDetailsModel data) =>
    json.encode(data.toJson());

class OrderProductDetailsModel {
  final String productName;
  final String unit;
  final String totalUnit;
  final String productImage;
  final int quantity;
  final int purchasePrice;
  final int salePrice;
  final String total;

  OrderProductDetailsModel({
    required this.productName,
    required this.unit,
    required this.totalUnit,
    required this.productImage,
    required this.quantity,
    required this.purchasePrice,
    required this.salePrice,
    required this.total,
  });

  factory OrderProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderProductDetailsModel(
        productName: json["product_name"],
        unit: json["unit"],
        totalUnit: json["totalUnit"],
        productImage: json["product_image"],
        quantity: json["quantity"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "unit": unit,
        "totalUnit": totalUnit,
        "product_image": productImage,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "total": total,
      };
}
