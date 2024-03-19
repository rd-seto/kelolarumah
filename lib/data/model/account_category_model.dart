// To parse this JSON data, do
//
//     final accountCategoryModel = accountCategoryModelFromJson(jsonString);

import 'dart:convert';

AccountCategoryModel accountCategoryModelFromJson(String str) =>
    AccountCategoryModel.fromJson(json.decode(str));

String accountCategoryModelToJson(AccountCategoryModel data) =>
    json.encode(data.toJson());

class AccountCategoryModel {
  final bool? status;
  final String? message;
  final List<AccountCategory>? accountsData;

  AccountCategoryModel({
    this.status,
    this.message,
    this.accountsData,
  });

  factory AccountCategoryModel.fromJson(Map<String, dynamic> json) =>
      AccountCategoryModel(
        status: json["status"],
        message: json["message"],
        accountsData: json["data"] == null
            ? []
            : List<AccountCategory>.from(
                json["data"]!.map((x) => AccountCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": accountsData == null
            ? []
            : List<dynamic>.from(accountsData!.map((x) => x.toJson())),
      };
}

class AccountCategory {
  final int? id;
  final String? name;
  final String? type;

  AccountCategory({
    this.id,
    this.name,
    this.type,
  });

  factory AccountCategory.fromJson(Map<String, dynamic> json) =>
      AccountCategory(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}
