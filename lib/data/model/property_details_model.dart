

import 'dart:convert';

PropertyDetailsModel propertyDetailsModelFromJson(String str) => PropertyDetailsModel.fromJson(json.decode(str));

String propertyDetailsModelToJson(PropertyDetailsModel data) => json.encode(data.toJson());

class PropertyDetailsModel {
  PropertyDetailsModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) => PropertyDetailsModel(
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
  Data({
    this.title,
    this.property,
    this.currentTenant,
    this.previousTenants,
    this.facilities,
    this.gallery,
    this.floorPlans,
  });

  String? title;
  List<Property>? property;
  CurrentTenant? currentTenant;
  List<PreviousTenant>? previousTenants;
  List<Facility>? facilities;
  List<FloorPlan>? gallery;
  List<FloorPlan>? floorPlans;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    property: json["property"] == null ? [] : List<Property>.from(json["property"]!.map((x) => Property.fromJson(x))),
    currentTenant: json["current_tenant"] == null ? null : CurrentTenant.fromJson(json["current_tenant"]),
    previousTenants: json["previous_tenants"] == null ? [] : List<PreviousTenant>.from(json["previous_tenants"]!.map((x) => PreviousTenant.fromJson(x))),
    facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
    gallery: json["gallery"] == null ? [] : List<FloorPlan>.from(json["gallery"]!.map((x) => FloorPlan.fromJson(x))),
    floorPlans: json["floor_plans"] == null ? [] : List<FloorPlan>.from(json["floor_plans"]!.map((x) => FloorPlan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "property": property == null ? [] : List<dynamic>.from(property!.map((x) => x.toJson())),
    "current_tenant": currentTenant?.toJson(),
    "previous_tenants": previousTenants == null ? [] : List<dynamic>.from(previousTenants!.map((x) => x.toJson())),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x.toJson())),
    "floor_plans": floorPlans == null ? [] : List<dynamic>.from(floorPlans!.map((x) => x.toJson())),
  };
}

class CurrentTenant {
  CurrentTenant({
    this.id,
    this.name,
    this.presentAddress,
    this.propertiesName,
    this.image,
    this.comment,
    this.rating,
  });

  int? id;
  String? name;
  String? presentAddress;
  String? propertiesName;
  String? image;
  String? comment;
  String? rating;

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

class Facility {
  Facility({
    this.id,
    this.name,
    this.content,
    this.image,
  });

  int? id;
  String? name;
  String? content;
  String? image;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
    id: json["id"],
    name: json["name"],
    content: json["content"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "content": content,
    "image": image,
  };
}

class FloorPlan {
  FloorPlan({
    this.id,
    this.title,
    this.path,
    this.originalPath,
  });

  int? id;
  String? title;
  String? path;
  String? originalPath;

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

class PreviousTenant {
  PreviousTenant({
    this.id,
    this.name,
    this.image,
    this.comment,
    this.rating,
    this.startDate,
    this.endDate,
  });

  int? id;
  String? name;
  String? image;
  String? comment;
  String? rating;
  String? startDate;
  String? endDate;

  factory PreviousTenant.fromJson(Map<String, dynamic> json) => PreviousTenant(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    comment: json["comment"],
    rating: json["rating"],
    startDate: json["start_date"] ,
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "comment": comment,
    "rating": rating,
    "start_date": startDate,
    "end_date": endDate,
  };
}

class Property {
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

  int? id;
  String? name;
  String? image;
  String? dealType;
  String? type;
  String? completion;
  int? totalUnit;
  int? totalOccupied;
  int? totalRent;
  int? totalSell;
  String? address;
  String? city;
  String? country;
  String? zipCode;
  String? size;
  String? diningCombined;
  int? bedroom;
  int? bathroom;
  int? rentAmount;
  String? flatNo;
  String? description;

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
