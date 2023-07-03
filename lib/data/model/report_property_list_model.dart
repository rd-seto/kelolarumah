class ReportPropertyModel {
  ReportPropertyModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory ReportPropertyModel.fromJson(Map<String, dynamic> json) => ReportPropertyModel(
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
    this.properties,
    this.messages,
  });

  List<ReportProperty>? properties;
  String? messages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    properties: json["properties"] == null ? [] : List<ReportProperty>.from(json["properties"]!.map((x) => ReportProperty.fromJson(x))),
    messages: json["messages"],
  );

  Map<String, dynamic> toJson() => {
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "messages": messages,
  };
}

class ReportProperty {
  ReportProperty({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ReportProperty.fromJson(Map<String, dynamic> json) => ReportProperty(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
