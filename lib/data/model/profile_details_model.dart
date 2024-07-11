// To parse this JSON data, do
//
//     final profileDetailsModel = profileDetailsModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) => ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) => json.encode(data.toJson());

class ProfileDetailsModel {
  final bool status;
  final String message;
  final Data data;

  ProfileDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) => ProfileDetailsModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final ProfileInfo profileInfo;

  Data({
    required this.profileInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profileInfo: ProfileInfo.fromJson(json["profile_info"]),
  );

  Map<String, dynamic> toJson() => {
    "profile_info": profileInfo.toJson(),
  };
}

class ProfileInfo {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final String? occupation;
  final String? designation;
  final String? institution;
  final String? nid;
  final DateTime? dateOfBirth;
  final String? passport;
  final String? gender;
  final int? roleId;
  final String? avatar;

  ProfileInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.occupation,
    required this.designation,
    required this.institution,
    required this.nid,
    required this.dateOfBirth,
    required this.passport,
    required this.gender,
    required this.roleId,
    required this.avatar,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    occupation: json["occupation"],
    designation: json["designation"],
    institution: json["institution"],
    nid: json["nid"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    passport: json["passport"],
    gender: json["gender"],
    roleId: json["role_id"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "occupation": occupation,
    "designation": designation,
    "institution": institution,
    "nid": nid,
    "date_of_birth": "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
    "passport": passport,
    "gender": gender,
    "role_id": roleId,
    "avatar": avatar,
  };
}
