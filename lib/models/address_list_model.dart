// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) =>
    AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) =>
    json.encode(data.toJson());

class AddressListModel {
  final int id;
  final int userId;
  final String name;
  final dynamic email;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final dynamic country;
  final dynamic zip;
  final String addressType;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  AddressListModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.zip,
    required this.addressType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      AddressListModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        country: json["country"],
        zip: json["zip"],
        addressType: json["address_type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "city": city,
        "state": state,
        "pincode": pincode,
        "country": country,
        "zip": zip,
        "address_type": addressType,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
