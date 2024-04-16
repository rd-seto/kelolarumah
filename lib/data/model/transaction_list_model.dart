import 'dart:convert';

TransactionListModel transactionListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

class TransactionListModel {
  final bool? result;
  final String? apiEndPoint;
  final String? message;
  final Data? data;

  TransactionListModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        result: json["result"],
        apiEndPoint: json["api_end_point"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "api_end_point": apiEndPoint,
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
  final int? accountId;
  final DateTime? date;
  final String? type;
  final String? referenceNo;
  final String? paymentMethod;
  final String? amount;

  ListElement({
    this.id,
    this.accountId,
    this.date,
    this.type,
    this.referenceNo,
    this.paymentMethod,
    this.amount,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        accountId: json["account_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        type: json["type"],
        referenceNo: json["reference_no"],
        paymentMethod: json["payment_method"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "type": type,
        "reference_no": referenceNo,
        "payment_method": paymentMethod,
        "amount": amount,
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
