import 'dart:convert';

TenantPropertyModel tenantPropertyModelFromJson(String str) => TenantPropertyModel.fromJson(json.decode(str));


class TenantPropertyModel {
  final bool? status;
  final String? message;
  final Data? data;

  TenantPropertyModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantPropertyModel.fromJson(Map<String, dynamic> json) => TenantPropertyModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );
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
    trendingProperties: Properties.fromJson(json["trending_properties"]),
    recommendedProperties: Properties.fromJson(json["recommended_properties"]),
    discountedProperties: Properties.fromJson(json["discounted_properties"]),
    rentProperties: Properties.fromJson(json["rent_properties"]),
    buyProperties: Properties.fromJson(json["buy_properties"]),
  );
}

class Properties {
  final List<ListElement>? list;

  Properties({
    this.list,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );
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
  final String? rentType;
  final String? image;
  final int? type;
  final String? vacant;
  final String? flatNo;
  final String? completion;
  final String? dealType;
  final String? category;
  final Owner? owner;

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
    flatNo: json["flat_no"],
    completion: json["completion"],
    dealType: json["deal_type"],
    category: json["category"],
    owner: Owner.fromJson(json["owner"]),
  );
}

class Owner {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  Owner({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );
}
