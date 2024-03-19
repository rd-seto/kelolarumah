// To parse this JSON data, do
//
//     final allDropDownModel = allDropDownModelFromJson(jsonString);

import 'dart:convert';

AllDropDownModel allDropDownModelFromJson(String str) =>
    AllDropDownModel.fromJson(json.decode(str));

String allDropDownModelToJson(AllDropDownModel data) =>
    json.encode(data.toJson());

class AllDropDownModel {
  final bool? result;
  final String? apiEndPoint;
  final String? message;
  final Data? data;

  AllDropDownModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory AllDropDownModel.fromJson(Map<String, dynamic> json) =>
      AllDropDownModel(
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
  final String? messages;
  final Map<String, String>? dealType;
  final List<String>? type;
  final List<String>? completion;
  final List<Facility>? facilities;
  final List<Category>? categories;

  Data({
    this.messages,
    this.dealType,
    this.type,
    this.completion,
    this.facilities,
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        messages: json["messages"],
        dealType: Map.from(json["deal_type"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
        completion: json["completion"] == null
            ? []
            : List<String>.from(json["completion"]!.map((x) => x)),
        facilities: json["facilities"] == null
            ? []
            : List<Facility>.from(
                json["facilities"]!.map((x) => Facility.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "messages": messages,
        "deal_type":
            Map.from(dealType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
        "completion": completion == null
            ? []
            : List<dynamic>.from(completion!.map((x) => x)),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Facility {
  final int? id;
  final String? name;
  final String? image;

  Facility({
    this.id,
    this.name,
    this.image,
  });

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
