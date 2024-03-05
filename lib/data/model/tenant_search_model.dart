// To parse this JSON data, do
//
//     final tenantSearchModel = tenantSearchModelFromJson(jsonString);

import 'dart:convert';

TenantSearchModel tenantSearchModelFromJson(String str) =>
    TenantSearchModel.fromJson(json.decode(str));

String tenantSearchModelToJson(TenantSearchModel data) =>
    json.encode(data.toJson());

class TenantSearchModel {
  final bool? status;
  final String? message;
  final List<Datum>? data;

  TenantSearchModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantSearchModel.fromJson(Map<String, dynamic> json) =>
      TenantSearchModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final int? advertiseId;
  final String? name;
  final String? slug;
  final String? address;
  final int? bedrooms;
  final int? bathrooms;
  final String? size;
  final String? bookingAmount;
  final String? price;
  final String? discountAmount;
  final String? discountType;
  final dynamic rentType;
  final String? image;
  final int? type;
  final String? vacant;
  final String? flatNo;
  final String? completion;
  final String? dealType;
  final String? category;

  Datum({
    this.id,
    this.advertiseId,
    this.name,
    this.slug,
    this.address,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.bookingAmount,
    this.price,
    this.discountAmount,
    this.discountType,
    this.rentType,
    this.image,
    this.type,
    this.vacant,
    this.flatNo,
    this.completion,
    this.dealType,
    this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        advertiseId: json["advertise_id"],
        name: json["name"],
        slug: json["slug"],
        address: json["address"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        size: json["size"],
        bookingAmount: json["booking_amount"],
        price: json["price"],
        discountAmount: json["discount_amount"],
        discountType: json["discount_type"],
        rentType: json["rent_type"],
        image: json["image"],
        type: json["type"],
        vacant: json["vacant"],
        flatNo: json["flat_no"],
        completion: json["completion"],
        dealType: json["deal_type"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "advertise_id": advertiseId,
        "name": name,
        "slug": slug,
        "address": address,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "size": size,
        "booking_amount": bookingAmount,
        "price": price,
        "discount_amount": discountAmount,
        "discount_type": discountType,
        "rent_type": rentType,
        "image": image,
        "type": type,
        "vacant": vacant,
        "flat_no": flatNo,
        "completion": completion,
        "deal_type": dealType,
        "category": category,
      };
}
