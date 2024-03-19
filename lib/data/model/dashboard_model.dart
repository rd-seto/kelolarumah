import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  final bool? status;
  final String? message;
  final Data? data;

  DashboardModel({
    this.status,
    this.message,
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? totalProperties;
  final int? totalVacant;
  final int? totalOccupied;
  final List<Property>? properties;
  final List<Transaction>? transactions;

  Data({
    this.totalProperties,
    this.totalVacant,
    this.totalOccupied,
    this.properties,
    this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalProperties: json["total_properties"],
        totalVacant: json["total_vacant"],
        totalOccupied: json["total_occupied"],
        properties: json["properties"] == null
            ? []
            : List<Property>.from(
                json["properties"]!.map((x) => Property.fromJson(x))),
        transactions: json["transactions"] == null
            ? []
            : List<Transaction>.from(
                json["transactions"]!.map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_properties": totalProperties,
        "total_vacant": totalVacant,
        "total_occupied": totalOccupied,
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Property {
  final int? id;
  final String? name;
  final String? image;
  final String? dealType;
  final String? type;
  final String? completion;
  final String? status;

  Property({
    this.id,
    this.name,
    this.image,
    this.dealType,
    this.type,
    this.completion,
    this.status,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dealType: json["deal_type"],
        type: json["type"],
        completion: json["completion"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "deal_type": dealType,
        "type": type,
        "completion": completion,
        "status": status,
      };
}

class Transaction {
  final int? id;
  final int? accountId;
  final String? date;
  final String? type;
  final String? referenceNo;
  final String? paymentMethod;
  final String? amount;

  Transaction({
    this.id,
    this.accountId,
    this.date,
    this.type,
    this.referenceNo,
    this.paymentMethod,
    this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        accountId: json["account_id"],
        date: json["date"],
        type: json["type"],
        referenceNo: json["reference_no"],
        paymentMethod: json["payment_method"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "date": date,
        "type": type,
        "reference_no": referenceNo,
        "payment_method": paymentMethod,
        "amount": amount,
      };
}
