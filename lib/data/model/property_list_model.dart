// To parse this JSON data, do
//
//     final propertyListModel = propertyListModelFromJson(jsonString);

import 'dart:convert';

PropertyListModel propertyListModelFromJson(String str) =>
    PropertyListModel.fromJson(json.decode(str));

String propertyListModelToJson(PropertyListModel data) =>
    json.encode(data.toJson());

class PropertyListModel {
  final bool? result;
  final String? apiEndPoint;
  final String? message;
  final Data? data;

  PropertyListModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory PropertyListModel.fromJson(Map<String, dynamic> json) =>
      PropertyListModel(
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
  final Statistics? statistics;
  final Properties? properties;

  Data({
    this.statistics,
    this.properties,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statistics: json["statistics"] == null
            ? null
            : Statistics.fromJson(json["statistics"]),
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "statistics": statistics?.toJson(),
        "properties": properties?.toJson(),
      };
}

class Properties {
  final List<ListElement>? list;
  final Links? links;
  final Pagination? pagination;

  Properties({
    this.list,
    this.links,
    this.pagination,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
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
  final String? name;
  final String? image;
  final String? dealType;
  final String? type;
  final String? completion;
  final String? status;
  final int? totalUnit;
  final int? totalOccupied;
  final int? totalRent;
  final int? totalSell;

  ListElement({
    this.id,
    this.name,
    this.image,
    this.dealType,
    this.type,
    this.completion,
    this.status,
    this.totalUnit,
    this.totalOccupied,
    this.totalRent,
    this.totalSell,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dealType: json["deal_type"],
        type: json["type"],
        completion: json["completion"],
        status: json["status"],
        totalUnit: json["total_unit"],
        totalOccupied: json["total_occupied"],
        totalRent: json["total_rent"],
        totalSell: json["total_sell"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "deal_type": dealType,
        "type": type,
        "completion": completion,
        "status": status,
        "total_unit": totalUnit,
        "total_occupied": totalOccupied,
        "total_rent": totalRent,
        "total_sell": totalSell,
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

class Statistics {
  final int? total;
  final int? vacant;
  final int? occupied;

  Statistics({
    this.total,
    this.vacant,
    this.occupied,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        total: json["total"],
        vacant: json["vacant"],
        occupied: json["occupied"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "vacant": vacant,
        "occupied": occupied,
      };
}
