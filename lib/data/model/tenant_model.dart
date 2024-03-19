// To parse this JSON data, do
//
//     final tenantModel = tenantModelFromJson(jsonString);

import 'dart:convert';

TenantModel tenantModelFromJson(String str) =>
    TenantModel.fromJson(json.decode(str));

String tenantModelToJson(TenantModel data) => json.encode(data.toJson());

class TenantModel {
  final bool? status;
  final String? message;
  final Data? data;

  TenantModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
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
  final String? next;

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
  final String? name;
  final String? email;
  final String? dateOfBirth;
  final DateTime? joinDate;
  final dynamic gender;
  final String? phone;
  final String? country;
  final dynamic address;
  final String? occupation;
  final String? bloodGroup;
  final String? avater;

  ListElement({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.joinDate,
    this.gender,
    this.phone,
    this.country,
    this.address,
    this.occupation,
    this.bloodGroup,
    this.avater,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dateOfBirth: json["date_of_birth"],
        joinDate: json["join_date"] == null
            ? null
            : DateTime.parse(json["join_date"]),
        gender: json["gender"],
        phone: json["phone"],
        country: json["country"],
        address: json["address"],
        occupation: json["occupation"],
        bloodGroup: json["blood_group"],
        avater: json["avater"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "date_of_birth": dateOfBirth,
        "join_date":
            "${joinDate!.year.toString().padLeft(4, '0')}-${joinDate!.month.toString().padLeft(2, '0')}-${joinDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "country": country,
        "address": address,
        "occupation": occupation,
        "blood_group": bloodGroup,
        "avater": avater,
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
