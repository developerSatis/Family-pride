// To parse this JSON data, do
//
//     final flashDealProductModel = flashDealProductModelFromJson(jsonString);

import 'dart:convert';

FlashDealProductModel flashDealProductModelFromJson(String str) =>
    FlashDealProductModel.fromJson(json.decode(str));

String flashDealProductModelToJson(FlashDealProductModel data) =>
    json.encode(data.toJson());

class FlashDealProductModel {
  final int id;
  final String mainImage;
  final String mainImageUrl;

  FlashDealProductModel({
    required this.id,
    required this.mainImage,
    required this.mainImageUrl,
  });

  factory FlashDealProductModel.fromJson(Map<String, dynamic> json) =>
      FlashDealProductModel(
        id: json["id"],
        mainImage: json["main_image"],
        mainImageUrl: json["main_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_image": mainImage,
        "main_image_url": mainImageUrl,
      };
}
