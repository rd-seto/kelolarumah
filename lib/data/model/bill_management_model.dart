import 'dart:convert';

BillManagementModel billManagementModelFromJson(String str) =>
    BillManagementModel.fromJson(json.decode(str));

String billManagementModelToJson(BillManagementModel data) =>
    json.encode(data.toJson());

class BillManagementModel {
  final bool? status;
  final String? message;
  final Data? data;

  BillManagementModel({
    this.status,
    this.message,
    this.data,
  });

  factory BillManagementModel.fromJson(Map<String, dynamic> json) =>
      BillManagementModel(
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
  final List<ListElement>? list;
  final Links? links;
  final Pagination? pagination;

  Data({
    this.list,
    this.links,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "pagination": pagination?.toJson(),
      };
}

class Links {
  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

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
  final int? id;
  final DateTime? dueDate;
  final String? propertyId;
  final String? tenantId;
  final String? month;
  final String? amount;
  final String? paymentStatus;
  final int? status;
  final String? fineAmount;
  final String? totalAmount;

  ListElement({
    this.id,
    this.dueDate,
    this.propertyId,
    this.tenantId,
    this.month,
    this.amount,
    this.paymentStatus,
    this.status,
    this.fineAmount,
    this.totalAmount,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        propertyId: json["property_id"],
        tenantId: json["tenant_id"],
        month: json["month"],
        amount: json["amount"],
        paymentStatus: json["payment_status"],
        status: json["status"],
        fineAmount: json["fine_amount"],
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "property_id": propertyId,
        "tenant_id": tenantId,
        "month": month,
        "amount": amount,
        "payment_status": paymentStatus,
        "status": status,
        "fine_amount": fineAmount,
        "total_amount": totalAmount,
      };
}

class Pagination {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;

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
