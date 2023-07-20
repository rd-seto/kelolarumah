// To parse this JSON data, do
//
//     final tenantsDetailsModel = tenantsDetailsModelFromJson(jsonString);

import 'dart:convert';

TenantsDetailsModel tenantsDetailsModelFromJson(String str) =>
    TenantsDetailsModel.fromJson(json.decode(str));


class TenantsDetailsModel {
  TenantsDetailsModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory TenantsDetailsModel.fromJson(Map<String, dynamic> json) =>
      TenantsDetailsModel(
        result: json["result"],
        apiEndPoint: json["api_end_point"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

}

class Data {
  Data({
    this.basicInfo,
    this.document,
    this.emergencyContact,
    this.accounts,
    this.tenantTransaction,
    this.agreement,
    this.messages,
  });

  BasicInfo? basicInfo;
  List<Document>? document;
  List<EmergencyContact>? emergencyContact;
  List<Account>? accounts;
  List<TenantTransaction>? tenantTransaction;
  Agreement? agreement;
  String? messages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicInfo: json["basicInfo"] == null
            ? null
            : BasicInfo.fromJson(json["basicInfo"]),
        document: json["document"] == null
            ? []
            : List<Document>.from(
                json["document"]!.map((x) => Document.fromJson(x))),
        emergencyContact:  json["emergencyContact"] == null
            ? []
            : List<EmergencyContact>.from(
            json["emergencyContact"]!.map((x) => EmergencyContact.fromJson(x))),

        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"]!.map((x) => Account.fromJson(x))),
        tenantTransaction: json["tenantTransaction"] == null
            ? []
            : List<TenantTransaction>.from(json["tenantTransaction"]!
                .map((x) => TenantTransaction.fromJson(x))),
        agreement: json["agreement"] == null
            ? null
            : Agreement.fromJson(json["agreement"]),
        messages: json["messages"],
      );

}

class Account {
  Account({
    this.id,
    this.name,
    this.branch,
    this.accountNumber,
    this.accountName,
  });

  int? id;
  String? name;
  String? branch;
  String? accountNumber;
  String? accountName;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        name: json["name"],
        branch: json["branch"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "branch": branch,
        "account_number": accountNumber,
        "account_name": accountName,
      };
}

class Agreement {
  Agreement({
    this.id,
    this.property,
    this.moveIn,
    this.moveOut,
    this.rentAmount,
    this.rentType,
    this.reminderDate,
    this.note,
    this.advanceAmount,
    this.status,
    this.rentFor,
  });

  int? id;
  String? property;
  String? moveIn;
  String? moveOut;
  int? rentAmount;
  String? rentType;
  String? reminderDate;
  String? note;
  int? advanceAmount;
  int? status;
  int? rentFor;

  factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
        id: json["id"],
        property: json["property"],
        moveIn: json["move_in"],
        moveOut: json["move_out"],
        rentAmount: json["rent_amount"],
        rentType: json["rent_type"],
        reminderDate: json["reminder_date"],
        note: json["note"],
        advanceAmount: json["advance_amount"],
        status: json["status"],
        rentFor: json["rent_for"],
      );
}

class BasicInfo {
  BasicInfo(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.occupation,
      this.joinDate,
      this.institution,
      this.nid,
      this.passport,
      this.designation,
      this.presentAddress,
      this.nationality,
      this.image});

  int? id;
  String? name;
  String? email;
  String? phone;
  String? occupation;
  String? joinDate;
  String? institution;
  String? nid;
  String? passport;
  String? designation;
  String? presentAddress;
  String? nationality;
  String? image;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      occupation: json["occupation"],
      joinDate: json["join_date"],
      institution: json["institution"],
      nid: json["nid"],
      passport: json["passport"],
      designation: json["designation"],
      presentAddress: json["present_address"],
      nationality: json["nationality"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "occupation": occupation,
        "join_date": joinDate,
        "institution": institution,
        "nid": nid,
        "passport": passport,
        "designation": designation,
        "present_address": presentAddress,
        "nationality": nationality,
        "image": image
      };
}

class Document {
  Document({
    this.id,
    this.filename,
    this.date,
    this.icon,
    this.size,
  });

  int? id;
  String? filename;
  String? date;
  String? icon;
  String? size;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        filename: json["filename"],
        date: json["date"],
        icon: json["icon"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "icon": icon,
        "size": size,
      };
}

class EmergencyContact {
  EmergencyContact({
    this.id,
    this.name,
    this.relation,
    this.phone,
    this.email,
    this.type,
    this.occupied,
    this.image,
  });

  int? id;
  String? name;
  String? relation;
  String? phone;
  String? email;
  String? type;
  String? occupied;
  String? image;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        id: json["id"],
        name: json["name"],
        relation: json["relation"],
        phone: json["phone"],
        email: json["email"],
        type: json["type"],
        occupied: json["occupied"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "relation": relation,
        "phone": phone,
        "email": email,
        "type": type,
        "occupied": occupied,
        "image": image,
      };
}

class TenantTransaction {
  TenantTransaction({
    this.id,
    this.property,
    this.amount,
    this.type,
    this.bankName,
    this.date,
    this.attachmentCount,
    this.attachmentFile,
  });

  int? id;
  String? property;
  int? amount;
  String? type;
  String? bankName;
  String? date;
  String? attachmentCount;
  String? attachmentFile;

  factory TenantTransaction.fromJson(Map<String, dynamic> json) =>
      TenantTransaction(
        id: json["id"],
        property: json["property"],
        amount: json["amount"],
        type: json["type"],
        bankName: json["bank_name"],
        date: json["date"],
        attachmentCount: json["attachment_count"],
        attachmentFile: json["attachment_file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property": property,
        "amount": amount,
        "type": type,
        "bank_name": bankName,
        "attachment_count": attachmentCount,
        "attachment_file": attachmentFile,
      };
}
