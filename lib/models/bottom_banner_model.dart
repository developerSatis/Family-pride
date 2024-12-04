// To parse this JSON data, do
//
//     final bottomBannerModel = bottomBannerModelFromJson(jsonString);

import 'dart:convert';

BottomBannerModel bottomBannerModelFromJson(String str) =>
    BottomBannerModel.fromJson(json.decode(str));

String bottomBannerModelToJson(BottomBannerModel data) =>
    json.encode(data.toJson());

class BottomBannerModel {
  final int id;
  final String image;
  final String? title;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  BottomBannerModel({
    required this.id,
    required this.image,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BottomBannerModel.fromJson(Map<String, dynamic> json) =>
      BottomBannerModel(
        id: json["id"],
        image: json["image"],
        title: json["title"] ?? "",
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
