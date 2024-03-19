// To parse this JSON data, do
//
//     final propertyDetailsModel = propertyDetailsModelFromJson(jsonString);

import 'dart:convert';

PropertyDetailsModel propertyDetailsModelFromJson(String str) =>
    PropertyDetailsModel.fromJson(json.decode(str));

String propertyDetailsModelToJson(PropertyDetailsModel data) =>
    json.encode(data.toJson());

class PropertyDetailsModel {
  final bool? result;
  final String? apiEndPoint;
  final String? message;
  final Data? data;

  PropertyDetailsModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) =>
      PropertyDetailsModel(
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
  final String? title;
  final Property? property;
  final List<CurrentTenant>? currentTenant;
  final List<dynamic>? previousTenants;
  final List<dynamic>? facilities;
  final List<FloorPlan>? gallery;
  final List<FloorPlan>? floorPlans;

  Data({
    this.title,
    this.property,
    this.currentTenant,
    this.previousTenants,
    this.facilities,
    this.gallery,
    this.floorPlans,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
        currentTenant: json["current_tenant"] == null
            ? []
            : List<CurrentTenant>.from(
                json["current_tenant"]!.map((x) => CurrentTenant.fromJson(x))),
        previousTenants: json["previous_tenants"] == null
            ? []
            : List<dynamic>.from(json["previous_tenants"]!.map((x) => x)),
        facilities: json["facilities"] == null
            ? []
            : List<dynamic>.from(json["facilities"]!.map((x) => x)),
        gallery: json["gallery"] == null
            ? []
            : List<FloorPlan>.from(
                json["gallery"]!.map((x) => FloorPlan.fromJson(x))),
        floorPlans: json["floor_plans"] == null
            ? []
            : List<FloorPlan>.from(
                json["floor_plans"]!.map((x) => FloorPlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "property": property?.toJson(),
        "current_tenant": currentTenant == null
            ? []
            : List<dynamic>.from(currentTenant!.map((x) => x.toJson())),
        "previous_tenants": previousTenants == null
            ? []
            : List<dynamic>.from(previousTenants!.map((x) => x)),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x)),
        "gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "floor_plans": floorPlans == null
            ? []
            : List<dynamic>.from(floorPlans!.map((x) => x.toJson())),
      };
}

class CurrentTenant {
  final int? id;
  final String? name;
  final String? presentAddress;
  final String? propertiesName;
  final String? image;
  final String? comment;
  final String? rating;

  CurrentTenant({
    this.id,
    this.name,
    this.presentAddress,
    this.propertiesName,
    this.image,
    this.comment,
    this.rating,
  });

  factory CurrentTenant.fromJson(Map<String, dynamic> json) => CurrentTenant(
        id: json["id"],
        name: json["name"],
        presentAddress: json["present_address"],
        propertiesName: json["properties_name"],
        image: json["image"],
        comment: json["comment"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "present_address": presentAddress,
        "properties_name": propertiesName,
        "image": image,
        "comment": comment,
        "rating": rating,
      };
}

class FloorPlan {
  final int? id;
  final String? title;
  final String? path;
  final String? originalPath;

  FloorPlan({
    this.id,
    this.title,
    this.path,
    this.originalPath,
  });

  factory FloorPlan.fromJson(Map<String, dynamic> json) => FloorPlan(
        id: json["id"],
        title: json["title"],
        path: json["path"],
        originalPath: json["original_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "path": path,
        "original_path": originalPath,
      };
}

class Property {
  final int? id;
  final String? name;
  final String? image;
  final String? dealType;
  final String? type;
  final String? completion;
  final int? totalUnit;
  final int? totalOccupied;
  final int? totalRent;
  final int? totalSell;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? size;
  final String? diningCombined;
  final int? bedroom;
  final int? bathroom;
  final int? rentAmount;
  final String? flatNo;
  final String? description;

  Property({
    this.id,
    this.name,
    this.image,
    this.dealType,
    this.type,
    this.completion,
    this.totalUnit,
    this.totalOccupied,
    this.totalRent,
    this.totalSell,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.size,
    this.diningCombined,
    this.bedroom,
    this.bathroom,
    this.rentAmount,
    this.flatNo,
    this.description,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dealType: json["deal_type"],
        type: json["type"],
        completion: json["completion"],
        totalUnit: json["total_unit"],
        totalOccupied: json["total_occupied"],
        totalRent: json["total_rent"],
        totalSell: json["total_sell"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        zipCode: json["zip_code"],
        size: json["size"],
        diningCombined: json["dining_combined"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        rentAmount: json["rent_amount"],
        flatNo: json["flat_no"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "deal_type": dealType,
        "type": type,
        "completion": completion,
        "total_unit": totalUnit,
        "total_occupied": totalOccupied,
        "total_rent": totalRent,
        "total_sell": totalSell,
        "address": address,
        "city": city,
        "country": country,
        "zip_code": zipCode,
        "size": size,
        "dining_combined": diningCombined,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "rent_amount": rentAmount,
        "flat_no": flatNo,
        "description": description,
      };
}
