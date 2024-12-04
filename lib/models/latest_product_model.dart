// To parse this JSON data, do
//
//     final latestProductModel = latestProductModelFromJson(jsonString);

import 'dart:convert';

LatestProductModel latestProductModelFromJson(String str) =>
    LatestProductModel.fromJson(json.decode(str));

String latestProductModelToJson(LatestProductModel data) =>
    json.encode(data.toJson());

class LatestProductModel {
  final int categoryId;
  final String name;
  final String mainImage;

  LatestProductModel({
    required this.categoryId,
    required this.name,
    required this.mainImage,
  });

  factory LatestProductModel.fromJson(Map<String, dynamic> json) =>
      LatestProductModel(
        categoryId: json["category_id"],
        name: json["name"],
        mainImage: json["main_image"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "name": name,
        "main_image": mainImage,
      };
}
