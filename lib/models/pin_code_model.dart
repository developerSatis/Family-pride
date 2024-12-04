// To parse this JSON data, do
//
//     final pinCodeModel = pinCodeModelFromJson(jsonString);

import 'dart:convert';

PinCodeModel pinCodeModelFromJson(String str) =>
    PinCodeModel.fromJson(json.decode(str));

String pinCodeModelToJson(PinCodeModel data) => json.encode(data.toJson());

class PinCodeModel {
  final int id;
  final String? pincode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? state;
  final String? city;
  final String? area;
  final String? status;

  PinCodeModel({
    required this.id,
    required this.pincode,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.city,
    required this.area,
    required this.status,
  });

  factory PinCodeModel.fromJson(Map<String, dynamic> json) => PinCodeModel(
        id: json["id"],
        pincode: json["pincode"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        area: json["area"] ?? "",
        status: json["status"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pincode": pincode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "state": state,
        "city": city,
        "area": area,
        "status": status,
      };
}
