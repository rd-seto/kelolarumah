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
  final String? name;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? token;
  @HiveField(3)
  final int? id;
  @HiveField(4)
  final String? dateOfBirth;
  @HiveField(5)
  final String? gender;
  @HiveField(6)
  final String? nid;
  @HiveField(7)
  final String? passport;

  const UserModel(
      {this.name,
      this.email,
      this.token,
      this.id,
      this.gender,
      this.nid,
      this.passport,
      this.dateOfBirth});

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      name: json['name'] == null ? null : json["name"],
      email: json['email'],
      token: json['access_token'],
      id: json['id'],
      gender: json['gender'],
      nid: json['nid'],
      passport: json['passport'],
      dateOfBirth: json['date_of_birth'],
    );
  }

  @override
  List<Object?> get props => [name, email, id];
}
