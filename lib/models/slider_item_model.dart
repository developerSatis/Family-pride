// To parse this JSON data, do
//
//     final sliderDataModel = sliderDataModelFromJson(jsonString);

import 'dart:convert';

SliderDataModel sliderDataModelFromJson(String str) =>
    SliderDataModel.fromJson(json.decode(str));

String sliderDataModelToJson(SliderDataModel data) =>
    json.encode(data.toJson());

class SliderDataModel {
  final int id;
  final dynamic lable;
  final dynamic title;
  final dynamic subTitle;
  final dynamic btnLable;
  final dynamic btnUrl;
  final String image;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  SliderDataModel({
    required this.id,
    required this.lable,
    required this.title,
    required this.subTitle,
    required this.btnLable,
    required this.btnUrl,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SliderDataModel.fromJson(Map<String, dynamic> json) =>
      SliderDataModel(
        id: json["id"],
        lable: json["lable"],
        title: json["title"],
        subTitle: json["sub_title"],
        btnLable: json["btn_lable"],
        btnUrl: json["btn_url"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lable": lable,
        "title": title,
        "sub_title": subTitle,
        "btn_lable": btnLable,
        "btn_url": btnUrl,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
