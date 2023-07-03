class PropertyListModel {
  PropertyListModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory PropertyListModel.fromJson(Map<String, dynamic> json) => PropertyListModel(
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
    this.statistics,
    this.properties,
  });

  Statistics? statistics;
  List<Property>? properties;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
    properties: json["properties"] == null ? [] : List<Property>.from(json["properties"]!.map((x) => Property.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statistics": statistics?.toJson(),
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
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
  };
}

class Statistics {
  Statistics({
    this.total,
    this.vacant,
    this.occupied,
  });

  int? total;
  int? vacant;
  int? occupied;

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
