// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic brandId;
  final int? categoryId;
  final dynamic subcategoryId;
  final int? quantity;
  final String? unit;
  final dynamic price;
  final dynamic salePrice;
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
  final dynamic discountType;
  final dynamic discountValue;
  final String? metaTitle;
  final String? metaDescription;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic newPrice;
  final String? differencePercentage;
  final bool? outOfStock;
  final List<Cart> cart;

  ProductModel({
    required this.id,
    required this.name,
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
    required this.createdAt,
    required this.updatedAt,
    required this.newPrice,
    required this.differencePercentage,
    required this.outOfStock,
    required this.cart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        brandId: json["brand_id"],
        categoryId: json["category_id"] ?? 0,
        subcategoryId: json["subcategory_id"],
        quantity: json["quantity"] ?? 0,
        unit: json["unit"] ?? "",
        price: json["price"] ?? "",
        salePrice: json["sale_price"],
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
        discountType: json["discount_type"],
        discountValue: json["discount_value"],
        metaTitle: json["meta_title"] ?? "",
        metaDescription: json["meta_description"] ?? "",
        status: json["status"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        newPrice: json["new_price"],
        differencePercentage: json["difference_percentage"] ?? "",
        outOfStock: json["out_of_stock"] ?? false,
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "brand_id": brandId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "quantity": quantity,
        "unit": unit,
        "price": price,
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "new_price": newPrice,
        "difference_percentage": differencePercentage,
        "out_of_stock": outOfStock,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  final int id;
  final String userId;
  final int productId;
  final int quantity;

  Cart({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        quantity: json["total_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "total_quantity": quantity,
      };
}
