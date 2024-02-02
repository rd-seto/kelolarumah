// To parse this JSON data, do
//
//     final tenantWishlistModel = tenantWishlistModelFromJson(jsonString);

import 'dart:convert';

TenantWishlistModel tenantWishlistModelFromJson(String str) => TenantWishlistModel.fromJson(json.decode(str));

String tenantWishlistModelToJson(TenantWishlistModel data) => json.encode(data.toJson());

class TenantWishlistModel {
  bool? status;
  String? message;
  Data? data;

  TenantWishlistModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantWishlistModel.fromJson(Map<String, dynamic> json) => TenantWishlistModel(
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
  List<ListElement>? list;
  Links? links;
  Pagination? pagination;

  Data({
    this.list,
    this.links,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class ListElement {
  int? id;
  String? createdAt;
  Property? property;

  ListElement({
    this.id,
    this.createdAt,
    this.property,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    createdAt: json["created_at"],
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "property": property?.toJson(),
  };
}

class Property {
  int? id;
  String? name;
  String? slug;
  String? address;
  String? bedrooms;
  String? bathrooms;
  String? size;
  String? price;
  String? image;
  String? type;
  String? vacant;
  String? flatNo;
  String? completion;
  String? dealType;
  String? category;

  Property({
    this.id,
    this.name,
    this.slug,
    this.address,
    this.bedrooms,
    this.bathrooms,
    this.size,
    this.price,
    this.image,
    this.type,
    this.vacant,
    this.flatNo,
    this.completion,
    this.dealType,
    this.category,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    address: json["address"],
    bedrooms: json["bedrooms"].toString(),
    bathrooms: json["bathrooms"].toString(),
    size: json["size"],
    price: json["price"],
    image: json["image"],
    type: json["type"].toString(),
    vacant: json["vacant"],
    flatNo: json["flat_no"].toString(),
    completion: json["completion"],
    dealType: json["deal_type"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "address": address,
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "size": size,
    "price": price,
    "image": image,
    "type": type,
    "vacant": vacant,
    "flat_no": flatNo,
    "completion": completion,
    "deal_type": dealType,
    "category": category,
  };
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}
