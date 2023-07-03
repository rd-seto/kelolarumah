class AddPropertyDataModel {
  AddPropertyDataModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory AddPropertyDataModel.fromJson(Map<String, dynamic> json) => AddPropertyDataModel(
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
    this.messages,
    this.dealType,
    this.type,
    this.completion,
    this.facilities,
    this.categories,
  });

  String? messages;
  List<String>? dealType;
  List<String>? type;
  List<String>? completion;
  List<Facility>? facilities;
  List<Category>? categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messages: json["messages"],
    dealType: json["deal_type"] == null ? [] : List<String>.from(json["deal_type"]!.map((x) => x)),
    type: json["type"] == null ? [] : List<String>.from(json["type"]!.map((x) => x)),
    completion: json["completion"] == null ? [] : List<String>.from(json["completion"]!.map((x) => x)),
    facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages,
    "deal_type": dealType == null ? [] : List<dynamic>.from(dealType!.map((x) => x)),
    "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
    "completion": completion == null ? [] : List<dynamic>.from(completion!.map((x) => x)),
    "facilities": facilities == null ? [] : List<dynamic>.from(facilities!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

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
  Facility({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

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
