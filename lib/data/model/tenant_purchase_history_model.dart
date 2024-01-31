// To parse this JSON data, do
//
//     final tenantPurchaseHistoryModel = tenantPurchaseHistoryModelFromJson(jsonString);

import 'dart:convert';

TenantPurchaseHistoryModel tenantPurchaseHistoryModelFromJson(String str) => TenantPurchaseHistoryModel.fromJson(json.decode(str));

String tenantPurchaseHistoryModelToJson(TenantPurchaseHistoryModel data) => json.encode(data.toJson());

class TenantPurchaseHistoryModel {
  bool? status;
  String? message;
  Data? data;

  TenantPurchaseHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantPurchaseHistoryModel.fromJson(Map<String, dynamic> json) => TenantPurchaseHistoryModel(
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
  List<TenantPurchaseHistoryElement>? purchaseHistoryList;
  Links? links;
  Pagination? pagination;

  Data({
    this.purchaseHistoryList,
    this.links,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    purchaseHistoryList: json["list"] == null ? [] : List<TenantPurchaseHistoryElement>.from(json["list"]!.map((x) => TenantPurchaseHistoryElement.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "list": purchaseHistoryList == null ? [] : List<dynamic>.from(purchaseHistoryList!.map((x) => x.toJson())),
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

class TenantPurchaseHistoryElement {
  int? id;
  String? invoiceNo;
  DateTime? date;
  String? discountAmount;
  String? grandTotal;
  String? paidAmount;
  String? dueAmount;

  TenantPurchaseHistoryElement({
    this.id,
    this.invoiceNo,
    this.date,
    this.discountAmount,
    this.grandTotal,
    this.paidAmount,
    this.dueAmount,
  });

  factory TenantPurchaseHistoryElement.fromJson(Map<String, dynamic> json) => TenantPurchaseHistoryElement(
    id: json["id"],
    invoiceNo: json["invoice_no"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    discountAmount: json["discount_amount"].toString(),
    grandTotal: json["grand_total"].toString(),
    paidAmount: json["paid_amount"].toString(),
    dueAmount: json["due_amount"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice_no": invoiceNo,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "discount_amount": discountAmount,
    "grand_total": grandTotal,
    "paid_amount": paidAmount,
    "due_amount": dueAmount,
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
