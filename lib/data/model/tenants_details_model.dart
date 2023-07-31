
import 'dart:convert';

TenantsDetailsModel tenantsDetailsModelFromJson(String str) => TenantsDetailsModel.fromJson(json.decode(str));

class TenantsDetailsModel {
  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  TenantsDetailsModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory TenantsDetailsModel.fromJson(Map<String, dynamic> json) => TenantsDetailsModel(
    result: json["result"],
    apiEndPoint: json["api_end_point"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  BasicInfo? basicInfo;
  List<dynamic>? document;
  List<EmergencyContact>? emergencyContact;
  Account? accounts;
  List<TenantTransaction>? tenantTransaction;
  Agreement? agreement;
  String? messages;

  Data({
    this.basicInfo,
    this.document,
    this.emergencyContact,
    this.accounts,
    this.tenantTransaction,
    this.agreement,
    this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    basicInfo: json["basicInfo"] == null ? null : BasicInfo.fromJson(json["basicInfo"]),
    document: json["document"] == null ? [] : List<dynamic>.from(json["document"]!.map((x) => x)),
    emergencyContact: json["emergencyContact"] == null ? [] : List<EmergencyContact>.from(json["emergencyContact"]!.map((x) => EmergencyContact.fromJson(x))),
    accounts: json["accounts"] == null ? null : Account.fromJson(json["accounts"]),
    tenantTransaction: json["tenantTransaction"] == null ? [] : List<TenantTransaction>.from(json["tenantTransaction"]!.map((x) => TenantTransaction.fromJson(x))),
    agreement: json["agreement"] == null ? null : Agreement.fromJson(json["agreement"]),
    messages: json["messages"],
  );
}

class Account {
  int? id;
  String? name;
  String? branch;
  String? accountNumber;
  String? accountName;

  Account({
    this.id,
    this.name,
    this.branch,
    this.accountNumber,
    this.accountName,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json["id"],
    name: json["name"],
    branch: json["branch"],
    accountNumber: json["account_number"],
    accountName: json["account_name"],
  );
}

class Agreement {
  int? id;
  String? property;
  String? moveIn;
  String? moveOut;
  int? rentAmount;
  String? rentType;
  dynamic reminderDate;
  dynamic note;
  int? advanceAmount;
  int? status;
  dynamic rentFor;

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

  factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
    id: json["id"],
    property: json["property"],
    moveIn: json["move_in"] ,
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
  int? id;
  String? name;
  String? email;
  String? phone;
  String? occupation;
  String? joinDate;
  String? institution;
  String? nid;
  String? passport;
  String? presentAddress;
  String? nationality;
  String? image;

  BasicInfo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.occupation,
    this.joinDate,
    this.institution,
    this.nid,
    this.passport,
    this.presentAddress,
    this.nationality,
    this.image,
  });

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
    presentAddress: json["present_address"],
    nationality: json["nationality"],
    image: json["image"],
  );

}

class EmergencyContact {
  int? id;
  String? name;
  String? relation;
  String? phone;
  String? email;
  String? type;
  String? occupied;
  String? image;

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

  factory EmergencyContact.fromJson(Map<String, dynamic> json) => EmergencyContact(
    id: json["id"],
    name: json["name"],
    relation: json["relation"],
    phone: json["phone"],
    email: json["email"],
    type: json["type"],
    occupied: json["occupied"],
    image: json["image"],
  );

}

class TenantTransaction {
  int? id;
  String? property;
  int? amount;
  String? type;
  DateTime? date;
  int? attachmentCount;
  String? attachmentFile;

  TenantTransaction({
    this.id,
    this.property,
    this.amount,
    this.type,
    this.date,
    this.attachmentCount,
    this.attachmentFile,
  });

  factory TenantTransaction.fromJson(Map<String, dynamic> json) => TenantTransaction(
    id: json["id"],
    property: json["property"],
    amount: json["amount"],
    type: json["type"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    attachmentCount: json["attachment_count"],
    attachmentFile: json["attachment_file"],
  );

}
