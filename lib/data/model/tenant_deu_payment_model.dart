// To parse this JSON data, do
//
//     final duePaymentModel = duePaymentModelFromJson(jsonString);

import 'dart:convert';

DuePaymentModel duePaymentModelFromJson(String str) => DuePaymentModel.fromJson(json.decode(str));

String duePaymentModelToJson(DuePaymentModel data) => json.encode(data.toJson());

class DuePaymentModel {
  bool? status;
  String? message;
  Data? data;

  DuePaymentModel({
    this.status,
    this.message,
    this.data,
  });

  factory DuePaymentModel.fromJson(Map<String, dynamic> json) => DuePaymentModel(
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
  List<DuePaymentListElement>? list;
  Links? links;
  Pagination? pagination;

  Data({
    this.list,
    this.links,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: json["list"] == null ? [] : List<DuePaymentListElement>.from(json["list"]!.map((x) => DuePaymentListElement.fromJson(x))),
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

class DuePaymentListElement {
  int? id;
  String? amount;
  String? paidAmount;
  String? dueAmount;
  String? paymentStatus;
  Property? property;

  DuePaymentListElement({
    this.id,
    this.amount,
    this.paidAmount,
    this.dueAmount,
    this.paymentStatus,
    this.property,
  });

  factory DuePaymentListElement.fromJson(Map<String, dynamic> json) => DuePaymentListElement(
    id: json["id"],
    amount: json["amount"],
    paidAmount: json["paid_amount"],
    dueAmount: json["due_amount"],
    paymentStatus: json["payment_status"],
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "paid_amount": paidAmount,
    "due_amount": dueAmount,
    "payment_status": paymentStatus,
    "property": property?.toJson(),
  };
}

class Property {
  int? id;
  String? name;
  String? slug;
  String? image;

  Property({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
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
