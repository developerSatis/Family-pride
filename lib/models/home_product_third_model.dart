// To parse this JSON data, do
//
//     final homeThirdProductModel = homeThirdProductModelFromJson(jsonString);

import 'dart:convert';

HomeThirdProductModel homeThirdProductModelFromJson(String str) =>
    HomeThirdProductModel.fromJson(json.decode(str));

String homeThirdProductModelToJson(HomeThirdProductModel data) =>
    json.encode(data.toJson());

class HomeThirdProductModel {
  final int id;
  final String name;
  final dynamic hsn;
  final String slug;
  final dynamic brandId;
  final int categoryId;
  final dynamic subcategoryId;
  final int quantity;
  final String unit;
  final int price;
  final String salePrice;
  final String mainImage;
  final String shortDescription;
  final String description;
  final String summary;
  final dynamic videoLink;
  final String isHome;
  final String isNew;
  final String isSale;
  final String isFeatured;
  final String isDiscount;
  final String isBeloved;
  final String discountType;
  final dynamic discountValue;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final String status;
  final String flashDeal;
  final int igst;
  final int cgst;
  final int sgst;
  final int purchase;
  final int maxLimit;
  final int stockAlert;
  final int type;
  final dynamic barcode;
  final dynamic moreImages;
  final String discountPercentage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int newPrice;
  final String differencePercentage;
  final List<dynamic> cart;

  HomeThirdProductModel({
    required this.id,
    required this.name,
    required this.hsn,
    required this.slug,
    required this.brandId,
    required this.categoryId,
    required this.subcategoryId,
    required this.quantity,
    required this.unit,
    required this.price,
    required this.salePrice,
    required this.mainImage,
    required this.shortDescription,
    required this.description,
    required this.summary,
    required this.videoLink,
    required this.isHome,
    required this.isNew,
    required this.isSale,
    required this.isFeatured,
    required this.isDiscount,
    required this.isBeloved,
    required this.discountType,
    required this.discountValue,
    required this.metaTitle,
    required this.metaDescription,
    required this.status,
    required this.flashDeal,
    required this.igst,
    required this.cgst,
    required this.sgst,
    required this.purchase,
    required this.maxLimit,
    required this.stockAlert,
    required this.type,
    required this.barcode,
    required this.moreImages,
    required this.discountPercentage,
    required this.createdAt,
    required this.updatedAt,
    required this.newPrice,
    required this.differencePercentage,
    required this.cart,
  });

  factory HomeThirdProductModel.fromJson(Map<String, dynamic> json) =>
      HomeThirdProductModel(
        id: json["id"],
        name: json["name"],
        hsn: json["hsn"],
        slug: json["slug"],
        brandId: json["brand_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        quantity: json["quantity"],
        unit: json["unit"],
        price: json["price"],
        salePrice: json["sale_price"],
        mainImage: json["main_image"],
        shortDescription: json["short_description"],
        description: json["description"],
        summary: json["summary"],
        videoLink: json["video_link"],
        isHome: json["is_home"],
        isNew: json["is_new"],
        isSale: json["is_sale"],
        isFeatured: json["is_featured"],
        isDiscount: json["is_discount"],
        isBeloved: json["is_beloved"],
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        status: json["status"],
        flashDeal: json["flash_deal"],
        igst: json["igst"],
        cgst: json["cgst"],
        sgst: json["sgst"],
        purchase: json["purchase"],
        maxLimit: json["max_limit"],
        stockAlert: json["stock_alert"],
        type: json["type"],
        barcode: json["barcode"],
        moreImages: json["more_images"],
        discountPercentage: json["discount_percentage"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        newPrice: json["new_price"],
        differencePercentage: json["difference_percentage"],
        cart: List<dynamic>.from(json["cart"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hsn": hsn,
        "slug": slug,
        "brand_id": brandId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "quantity": quantity,
        "unit": unit,
        "price": price,
        "sale_price": salePrice,
        "main_image": mainImage,
        "short_description": shortDescription,
        "description": description,
        "summary": summary,
        "video_link": videoLink,
        "is_home": isHome,
        "is_new": isNew,
        "is_sale": isSale,
        "is_featured": isFeatured,
        "is_discount": isDiscount,
        "is_beloved": isBeloved,
        "discount_type": discountType,
        "discount_value": discountValue,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "status": status,
        "flash_deal": flashDeal,
        "igst": igst,
        "cgst": cgst,
        "sgst": sgst,
        "purchase": purchase,
        "max_limit": maxLimit,
        "stock_alert": stockAlert,
        "type": type,
        "barcode": barcode,
        "more_images": moreImages,
        "discount_percentage": discountPercentage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "new_price": newPrice,
        "difference_percentage": differencePercentage,
        "cart": List<dynamic>.from(cart.map((x) => x)),
      };
}
