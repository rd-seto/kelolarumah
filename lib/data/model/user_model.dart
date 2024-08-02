import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

class UserLogin {
  String? email;
  String? password;

  UserLogin({this.email, this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

@HiveType(typeId: 0)
class UserModel extends Equatable {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? tokenType;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? phone;
  @HiveField(6)
  final String? occupation;
  @HiveField(7)
  final String? designation;
  @HiveField(8)
  final String? institution;
  @HiveField(9)
  final String? nid;
  @HiveField(10)
  final String? dateOfBirth;
  @HiveField(11)
  final String? passport;
  @HiveField(12)
  final String? gender;
  @HiveField(13)
  final int? roleId;
  @HiveField(14)
  final String? avatar;
  @HiveField(15)
  final bool? isVerified;

  const UserModel(
      {
        this.token,
        this.tokenType,
        this.id,
        this.name,
        this.email,
        this.phone,
        this.occupation,
        this.designation,
        this.institution,
        this.nid,
        this.dateOfBirth,
        this.passport,
        this.gender,
        this.roleId,
        this.avatar,
      this.isVerified});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['access_token'],
      tokenType: json['token_type'],
      id: json['id'],
      name: json['name'] == null ? null : json["name"],
      email: json['email'],
      phone: json['phone'],
      occupation: json['occupation'],
      designation: json['designation'],
      institution: json['institution'],
      nid: json['nid'],
      dateOfBirth: json['date_of_birth'],
      passport: json['passport'],
      gender: json['gender'],
      roleId: json['role_id'],
      avatar: json['avatar'],
      isVerified: json['is_verified']
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': token,
    "token_type": tokenType,
    'id': id,
    "name": name,
    "email": email,
    "phone":phone,
    "occupation": occupation,
    "designation": designation,
    "institution":institution,
    "nid": nid,
    "date_of_birth": dateOfBirth,
    "passport": passport,
    'gender': gender,
    "role_id": roleId,
    "avatar": avatar,
  };

  @override
  List<Object?> get props => [name, email, id, avatar];
}
