// To parse this JSON data, do
//
//     final productHomeModel = productHomeModelFromJson(jsonString);

import 'dart:convert';

ProductHomeModel productHomeModelFromJson(String str) =>
    ProductHomeModel.fromJson(json.decode(str));

String productHomeModelToJson(ProductHomeModel data) =>
    json.encode(data.toJson());

class ProductHomeModel {
  final int? id;
  final String? name;
  final dynamic hsn;
  final String? slug;
  final int? brandId;
  final int? categoryId;
  final int? subcategoryId;
  final int? quantity;
  final int? quantityLeft;
  final String? unit;
  final dynamic price;
  final String? salePrice;
  final String? offerPrice;
  final String? mainImage;
  final String? shortDescription;
  final String? description;
  final String? summary;
  final String? videoLink;
  final String? isHome;
  final String? isNew;
  final String? isSale;
  final String? isFeatured;
  final String? isDiscount;
  final String? isBeloved;
  final String? discountType;
  final dynamic discountValue;
  final String? metaTitle;
  final String? metaDescription;
  final String? status;
  final String? flashDeal;
  final dynamic igst;
  final int? cgst;
  final int? sgst;
  final String? discountPercentage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double? newPrice;
  final String? differencePercentage;
  final bool? outOfStock;
  final List<Cart> cart;

  ProductHomeModel({
    required this.id,
    required this.name,
    required this.hsn,
    required this.slug,
    required this.brandId,
    required this.categoryId,
    required this.subcategoryId,
    required this.quantity,
    required this.quantityLeft,
    required this.unit,
    required this.price,
    required this.salePrice,
    required this.offerPrice,
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
    required this.discountPercentage,
    required this.createdAt,
    required this.updatedAt,
    required this.newPrice,
    required this.differencePercentage,
    required this.outOfStock,
    required this.cart,
  });

  factory ProductHomeModel.fromJson(Map<String, dynamic> json) =>
      ProductHomeModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        hsn: json["hsn"],
        slug: json["slug"] ?? "",
        brandId: json["brand_id"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        subcategoryId: json["subcategory_id"] ?? 0,
        quantity: json["quantity"] ?? 0,
        quantityLeft: json["quantity_left"] ?? 1,
        unit: json["unit"] ?? "",
        price: json["price"],
        salePrice: json["sale_price"] ?? "",
        offerPrice: json["offer_price"] ?? "",
        mainImage: json["main_image"] ?? "",
        shortDescription: json["short_description"] ?? "",
        description: json["description"] ?? "",
        summary: json["summary"] ?? "",
        videoLink: json["video_link"] ?? "",
        isHome: json["is_home"] ?? "",
        isNew: json["is_new"] ?? "",
        isSale: json["is_sale"] ?? "",
        isFeatured: json["is_featured"] ?? "",
        isDiscount: json["is_discount"] ?? "",
        isBeloved: json["is_beloved"] ?? "",
        discountType: json["discount_type"] ?? "",
        discountValue: json["discount_value"],
        metaTitle: json["meta_title"] ?? "",
        metaDescription: json["meta_description"] ?? "",
        status: json["status"] ?? "",
        flashDeal: json["flash_deal"] ?? "",
        igst: json["igst"],
        cgst: json["cgst"] ?? 0,
        sgst: json["sgst"] ?? 0,
        discountPercentage: json["discount_percentage"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        newPrice: json["new_price"]?.toDouble(),
        differencePercentage: json["difference_percentage"] ?? "",
        outOfStock: json["out_of_stock"] ?? false,
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
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
        "quantity_left": quantityLeft,
        "unit": unit,
        "price": price,
        "sale_price": salePrice,
        "offer_price": offerPrice,
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
        "discount_percentage": discountPercentage,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "new_price": newPrice,
        "difference_percentage": differencePercentage,
        "out_of_stock": outOfStock,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  final int? id;
  final String? userId;
  final int? productId;
  final int quantity;

  Cart({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? "",
        productId: json["product_id"] ?? 0,
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "quantity": quantity,
      };
}
