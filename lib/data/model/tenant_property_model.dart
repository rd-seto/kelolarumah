import 'dart:convert';

TenantPropertyModel tenantPropertyModelFromJson(String str) =>
    TenantPropertyModel.fromJson(json.decode(str));

String tenantPropertyModelToJson(TenantPropertyModel data) =>
    json.encode(data.toJson());

class TenantPropertyModel {
  final bool? status;
  final String? message;
  final Data? data;

  TenantPropertyModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantPropertyModel.fromJson(Map<String, dynamic> json) =>
      TenantPropertyModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final Properties? trendingProperties;
  final Properties? recommendedProperties;
  final Properties? discountedProperties;
  final Properties? rentProperties;
  final Properties? buyProperties;

  Data({
    this.trendingProperties,
    this.recommendedProperties,
    this.discountedProperties,
    this.rentProperties,
    this.buyProperties,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trendingProperties: json["trending_properties"] == null
            ? null
            : Properties.fromJson(json["trending_properties"]),
        recommendedProperties: json["recommended_properties"] == null
            ? null
            : Properties.fromJson(json["recommended_properties"]),
        discountedProperties: json["discounted_properties"] == null
            ? null
            : Properties.fromJson(json["discounted_properties"]),
        rentProperties: json["rent_properties"] == null
            ? null
            : Properties.fromJson(json["rent_properties"]),
        buyProperties: json["buy_properties"] == null
            ? null
            : Properties.fromJson(json["buy_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "trending_properties": trendingProperties?.toJson(),
        "recommended_properties": recommendedProperties?.toJson(),
        "discounted_properties": discountedProperties?.toJson(),
        "rent_properties": rentProperties?.toJson(),
        "buy_properties": buyProperties?.toJson(),
      };
}

class Properties {
  final List<ListElement>? list;

  Properties({
    this.list,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
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
  final String? detailsUrl;
  final String? flatNo;
  final String? completion;
  final String? dealType;
  final String? category;
  final String? owner;

  ListElement({
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
    this.detailsUrl,
    this.flatNo,
    this.completion,
    this.dealType,
    this.category,
    this.owner,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
        detailsUrl: json["details_url"],
        flatNo: json["flat_no"],
        completion: json["completion"],
        dealType: json["deal_type"],
        category: json["category"],
        owner: json["owner"],
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
        "details_url": detailsUrl,
        "flat_no": flatNo,
        "completion": completion,
        "deal_type": dealType,
        "category": category,
        "owner": owner,
      };
}
