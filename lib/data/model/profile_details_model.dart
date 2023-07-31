import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) => ProfileDetailsModel.fromJson(json.decode(str));


class ProfileDetailsModel {
  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  ProfileDetailsModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) => ProfileDetailsModel(
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
  String? messages;
  ProfileInfo? profileInfo;

  Data({
    this.messages,
    this.profileInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messages: json["messages"],
    profileInfo: json["profile_info"] == null ? null : ProfileInfo.fromJson(json["profile_info"]),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages,
    "profile_info": profileInfo?.toJson(),
  };
}

class ProfileInfo {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? joinDate;
  String? nid;
  String? passport;
  String? occupation;
  String? institution;
  String? designation;
  dynamic gender;
  int? roleId;

  ProfileInfo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.joinDate,
    this.nid,
    this.passport,
    this.occupation,
    this.institution,
    this.designation,
    this.gender,
    this.roleId,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dateOfBirth: json["date_of_birth"],
    joinDate: json["join_date"] ,
    nid: json["nid"],
    passport: json["passport"],
    occupation: json["occupation"],
    institution: json["institution"],
    designation: json["designation"],
    gender: json["gender"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "date_of_birth": dateOfBirth,
    "join_date": joinDate,
    "nid": nid,
    "passport": passport,
    "occupation": occupation,
    "institution": institution,
    "designation": designation,
    "gender": gender,
    "role_id": roleId,
  };
}
