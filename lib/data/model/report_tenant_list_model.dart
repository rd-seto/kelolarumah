class ReportTenantModel {
  ReportTenantModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory ReportTenantModel.fromJson(Map<String, dynamic> json) => ReportTenantModel(
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

  List<ReportTenants>? properties;
  String? messages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    properties: json["tenants"] == null ? [] : List<ReportTenants>.from(json["tenants"]!.map((x) => ReportTenants.fromJson(x))),
    messages: json["messages"],
  );

  Map<String, dynamic> toJson() => {
    "tenants": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "messages": messages,
  };
}

class ReportTenants {
  ReportTenants({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory ReportTenants.fromJson(Map<String, dynamic> json) => ReportTenants(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
