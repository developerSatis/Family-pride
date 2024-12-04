// To parse this JSON data, do
//
//     final castListModel = castListModelFromJson(jsonString);

import 'dart:convert';

CastListModel castListModelFromJson(String str) =>
    CastListModel.fromJson(json.decode(str));

String castListModelToJson(CastListModel data) => json.encode(data.toJson());

class CastListModel {
  final int id;
  final String userId;
  final int quantity;
  final String? offerQuantity;
  final int productId;
  final String? offerPrice;
  final Product product;

  CastListModel({
    required this.id,
    required this.userId,
    required this.quantity,
    required this.offerQuantity,
    required this.productId,
    required this.offerPrice,
    required this.product,
  });

  factory CastListModel.fromJson(Map<String, dynamic> json) => CastListModel(
        id: json["id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        offerQuantity: json["offer_quantity"] ?? "",
        productId: json["product_id"],
        offerPrice: json["offer_price"] ?? "",
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "quantity": quantity,
        "offer_quantity": offerQuantity,
        "product_id": productId,
        "offer_price": offerPrice,
        "product": product.toJson(),
      };
}

class Product {
  final int id;
  final String mainImage;
  final String name;
  final dynamic price;
  final String unit;
  final dynamic newPrice;
  final String isDiscount;
  final dynamic discountType;
  final dynamic discountValue;

  Product({
    required this.id,
    required this.mainImage,
    required this.name,
    required this.price,
    required this.unit,
    required this.newPrice,
    required this.isDiscount,
    required this.discountType,
    required this.discountValue,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        mainImage: json["main_image"],
        name: json["name"],
        price: json["price"],
        unit: json["unit"],
        newPrice: json["new_price"],
        isDiscount: json["is_discount"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_image": mainImage,
        "name": name,
        "price": price,
        "unit": unit,
        "new_price": newPrice,
        "is_discount": isDiscount,
        "discount_type": discountType,
        "discount_value": discountValue,
      };
}
