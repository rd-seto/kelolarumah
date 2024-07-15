// To parse this JSON data, do
//
//     final occupiedListModel = occupiedListModelFromJson(jsonString);

import 'dart:convert';

OccupiedListModel occupiedListModelFromJson(String str) => OccupiedListModel.fromJson(json.decode(str));

class OccupiedListModel {
  final bool? status;
  final String? message;
  final List<OccupiedList>? occupiedList;

  OccupiedListModel({
    this.status,
    this.message,
    this.occupiedList,
  });

  factory OccupiedListModel.fromJson(Map<String, dynamic> json) => OccupiedListModel(
    status: json["status"],
    message: json["message"],
    occupiedList: json["data"] == null ? [] : List<OccupiedList>.from(json["data"]!.map((x) => OccupiedList.fromJson(x))),
  );
}

class OccupiedList {
  final int? id;
  final int? propertyId;
  final String? propertyName;

  OccupiedList({
    this.id,
    this.propertyId,
    this.propertyName,
  });

  factory OccupiedList.fromJson(Map<String, dynamic> json) => OccupiedList(
    id: json["id"],
    propertyId: json["property_id"],
    propertyName: json["property_name"],
  );
}
