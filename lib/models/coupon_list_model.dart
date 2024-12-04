// To parse this JSON data, do
//
//     final couponListModel = couponListModelFromJson(jsonString);

import 'dart:convert';

CouponListModel couponListModelFromJson(String str) =>
    CouponListModel.fromJson(json.decode(str));

String couponListModelToJson(CouponListModel data) =>
    json.encode(data.toJson());

class CouponListModel {
  final int id;
  final String couponName;
  final String couponCode;
  final String discountType;
  final int couponAmount;
  final String couponCashback;
  final String couponDescription;
  final int minimumSpend;
  final int maximumSpend;
  final int usageLimitPerCoupon;
  final int usageLimitPerUser;
  final DateTime startDate;
  final DateTime endDate;
  final String image;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;

  CouponListModel({
    required this.id,
    required this.couponName,
    required this.couponCode,
    required this.discountType,
    required this.couponAmount,
    required this.couponCashback,
    required this.couponDescription,
    required this.minimumSpend,
    required this.maximumSpend,
    required this.usageLimitPerCoupon,
    required this.usageLimitPerUser,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory CouponListModel.fromJson(Map<String, dynamic> json) =>
      CouponListModel(
        id: json["id"],
        couponName: json["coupon_name"],
        couponCode: json["coupon_code"],
        discountType: json["discount_type"],
        couponAmount: json["coupon_amount"],
        couponCashback: json["coupon_cashback"],
        couponDescription: json["coupon_description"],
        minimumSpend: json["minimum_spend"],
        maximumSpend: json["maximum_spend"],
        usageLimitPerCoupon: json["usage_limit_per_coupon"],
        usageLimitPerUser: json["usage_limit_per_user"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coupon_name": couponName,
        "coupon_code": couponCode,
        "discount_type": discountType,
        "coupon_amount": couponAmount,
        "coupon_cashback": couponCashback,
        "coupon_description": couponDescription,
        "minimum_spend": minimumSpend,
        "maximum_spend": maximumSpend,
        "usage_limit_per_coupon": usageLimitPerCoupon,
        "usage_limit_per_user": usageLimitPerUser,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
      };
}
