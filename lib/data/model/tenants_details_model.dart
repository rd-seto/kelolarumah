// To parse this JSON data, do
//
//     final tenantsDetailsModel = tenantsDetailsModelFromJson(jsonString);

import 'dart:convert';

TenantsDetailsModel tenantsDetailsModelFromJson(String str) =>
    TenantsDetailsModel.fromJson(json.decode(str));

String tenantsDetailsModelToJson(TenantsDetailsModel data) =>
    json.encode(data.toJson());

class TenantsDetailsModel {
  final bool? status;
  final String? message;
  final Data? data;

  TenantsDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantsDetailsModel.fromJson(Map<String, dynamic> json) =>
      TenantsDetailsModel(
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
  final int? id;
  final String? name;
  final String? email;
  final String? dateOfBirth;
  final dynamic gender;
  final String? phone;
  final String? altPhone;
  final String? bloodGroup;
  final String? avater;
  final String? socialSecurityNumber;
  final String? nationality;
  final dynamic taxCertificate;
  final dynamic tinNumber;
  final dynamic maritalStatus;
  final dynamic religion;
  final BasicInfo? basicInfo;
  final List<Account>? accounts;
  final List<Transaction>? transactions;
  final List<Document>? documents;
  final EntAddress? presentAddress;
  final EntAddress? permanentAddress;

  Data({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.phone,
    this.altPhone,
    this.bloodGroup,
    this.avater,
    this.socialSecurityNumber,
    this.nationality,
    this.taxCertificate,
    this.tinNumber,
    this.maritalStatus,
    this.religion,
    this.basicInfo,
    this.accounts,
    this.transactions,
    this.documents,
    this.presentAddress,
    this.permanentAddress,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        phone: json["phone"],
        altPhone: json["alt_phone"],
        bloodGroup: json["blood_group"],
        avater: json["avater"],
        socialSecurityNumber: json["social_security_number"],
        nationality: json["nationality"],
        taxCertificate: json["tax_certificate"],
        tinNumber: json["tin_number"],
        maritalStatus: json["marital_status"],
        religion: json["religion"],
        basicInfo: json["basic_info"] == null
            ? null
            : BasicInfo.fromJson(json["basic_info"]),
        accounts: json["accounts"] == null
            ? []
            : List<Account>.from(
                json["accounts"]!.map((x) => Account.fromJson(x))),
        transactions: json["transactions"] == null
            ? []
            : List<Transaction>.from(
                json["transactions"]!.map((x) => Transaction.fromJson(x))),
        documents: json["documents"] == null
            ? []
            : List<Document>.from(
                json["documents"]!.map((x) => Document.fromJson(x))),
        presentAddress: json["present_address"] == null
            ? null
            : EntAddress.fromJson(json["present_address"]),
        permanentAddress: json["permanent_address"] == null
            ? null
            : EntAddress.fromJson(json["permanent_address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "phone": phone,
        "alt_phone": altPhone,
        "blood_group": bloodGroup,
        "avater": avater,
        "social_security_number": socialSecurityNumber,
        "nationality": nationality,
        "tax_certificate": taxCertificate,
        "tin_number": tinNumber,
        "marital_status": maritalStatus,
        "religion": religion,
        "basic_info": basicInfo?.toJson(),
        "accounts": accounts == null
            ? []
            : List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "transactions": transactions == null
            ? []
            : List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "present_address": presentAddress?.toJson(),
        "permanent_address": permanentAddress?.toJson(),
      };
}

class Account {
  final int? id;
  final String? accountNumber;
  final String? accountName;
  final String? accountCategory;
  final dynamic bankBranch;
  final int? isDefault;

  Account({
    this.id,
    this.accountNumber,
    this.accountName,
    this.accountCategory,
    this.bankBranch,
    this.isDefault,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        accountCategory: json["account_category"],
        bankBranch: json["bank_branch"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_number": accountNumber,
        "account_name": accountName,
        "account_category": accountCategory,
        "bank_branch": bankBranch,
        "is_default": isDefault,
      };
}

class BasicInfo {
  final DateTime? joinDate;
  final String? occupation;
  final String? institution;
  final String? nid;
  final String? passport;

  BasicInfo({
    this.joinDate,
    this.occupation,
    this.institution,
    this.nid,
    this.passport,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        joinDate: json["join_date"] == null
            ? null
            : DateTime.parse(json["join_date"]),
        occupation: json["occupation"],
        institution: json["institution"],
        nid: json["nid"],
        passport: json["passport"],
      );

  Map<String, dynamic> toJson() => {
        "join_date":
            "${joinDate!.year.toString().padLeft(4, '0')}-${joinDate!.month.toString().padLeft(2, '0')}-${joinDate!.day.toString().padLeft(2, '0')}",
        "occupation": occupation,
        "institution": institution,
        "nid": nid,
        "passport": passport,
      };
}

class Document {
  final int? id;
  final String? filename;
  final String? attachmentType;
  final String? attachment;

  Document({
    this.id,
    this.filename,
    this.attachmentType,
    this.attachment,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        filename: json["filename"],
        attachmentType: json["attachment_type"],
        attachment: json["attachment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "attachment_type": attachmentType,
        "attachment": attachment,
      };
}

class EntAddress {
  final String? country;
  final String? state;
  final String? city;
  final String? address;

  EntAddress({
    this.country,
    this.state,
    this.city,
    this.address,
  });

  factory EntAddress.fromJson(Map<String, dynamic> json) => EntAddress(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "address": address,
      };
}

class Transaction {
  final int? id;
  final DateTime? date;
  final String? type;
  final String? accountName;
  final String? accountNumber;
  final String? referenceNo;
  final String? paymentMethod;
  final dynamic trxNo;
  final String? amount;
  final dynamic bankInfo;

  Transaction({
    this.id,
    this.date,
    this.type,
    this.accountName,
    this.accountNumber,
    this.referenceNo,
    this.paymentMethod,
    this.trxNo,
    this.amount,
    this.bankInfo,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        type: json["type"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        referenceNo: json["reference_no"],
        paymentMethod: json["payment_method"],
        trxNo: json["trx_no"],
        amount: json["amount"],
        bankInfo: json["bank_info"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "type": type,
        "account_name": accountName,
        "account_number": accountNumber,
        "reference_no": referenceNo,
        "payment_method": paymentMethod,
        "trx_no": trxNo,
        "amount": amount,
        "bank_info": bankInfo,
      };
}
