// To parse this JSON data, do
//
//     final tenantAccountModel = tenantAccountModelFromJson(jsonString);

import 'dart:convert';

TenantAccountModel tenantAccountModelFromJson(String str) => TenantAccountModel.fromJson(json.decode(str));

String tenantAccountModelToJson(TenantAccountModel data) => json.encode(data.toJson());

class TenantAccountModel {
  final bool? result;
  final String? apiEndPoint;
  final String? message;
  final List<AccountList>? data;

  TenantAccountModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory TenantAccountModel.fromJson(Map<String, dynamic> json) => TenantAccountModel(
    result: json["result"],
    apiEndPoint: json["api_end_point"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AccountList>.from(json["data"]!.map((x) => AccountList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "api_end_point": apiEndPoint,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AccountList {
  final int? id;
  final String? name;
  final String? balance;
  final String? accountNo;

  AccountList({
    this.id,
    this.name,
    this.balance,
    this.accountNo,
  });

  factory AccountList.fromJson(Map<String, dynamic> json) => AccountList(
    id: json["id"],
    name: json["name"],
    balance: json["balance"],
    accountNo: json["account_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "balance": balance,
    "account_no": accountNo,
  };
}
