// To parse this JSON data, do
//
//     final propertyFacilitiesModel = propertyFacilitiesModelFromJson(jsonString);

import 'dart:convert';

PropertyFacilitiesModel propertyFacilitiesModelFromJson(String str) =>
    PropertyFacilitiesModel.fromJson(json.decode(str));

String propertyFacilitiesModelToJson(PropertyFacilitiesModel data) =>
    json.encode(data.toJson());

class PropertyFacilitiesModel {
  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  PropertyFacilitiesModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory PropertyFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      PropertyFacilitiesModel(
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
  String? title;
  List<FacilityType>? facilityTypes;
  List<PropertyFacility>? propertyFacilities;

  Data({
    this.title,
    this.facilityTypes,
    this.propertyFacilities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        facilityTypes: json["facility_types"] == null
            ? []
            : List<FacilityType>.from(
                json["facility_types"]!.map((x) => FacilityType.fromJson(x))),
        propertyFacilities: json["propertyFacilities"] == null
            ? []
            : List<PropertyFacility>.from(json["propertyFacilities"]!
                .map((x) => PropertyFacility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "facility_types": facilityTypes == null
            ? []
            : List<dynamic>.from(facilityTypes!.map((x) => x.toJson())),
        "propertyFacilities": propertyFacilities == null
            ? []
            : List<dynamic>.from(propertyFacilities!.map((x) => x.toJson())),
      };
}

class FacilityType {
  int? id;
  String? name;

  FacilityType({
    this.id,
    this.name,
  });

  factory FacilityType.fromJson(Map<String, dynamic> json) => FacilityType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class PropertyFacility {
  int? id;
  int? propertyFacilityTypeId;
  String? facilityName;
  String? content;

  PropertyFacility({
    this.id,
    this.propertyFacilityTypeId,
    this.facilityName,
    this.content,
  });

  factory PropertyFacility.fromJson(Map<String, dynamic> json) =>
      PropertyFacility(
        id: json["id"],
        propertyFacilityTypeId: json["property_facility_type_id"],
        facilityName: json["facility_name"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_facility_type_id": propertyFacilityTypeId,
        "facility_name": facilityName,
        "content": content,
      };
}
