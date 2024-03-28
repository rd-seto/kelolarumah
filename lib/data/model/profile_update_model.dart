import 'dart:io';

class ProfileBasicInfoUpdateModel{

  ProfileBasicInfoUpdateModel({

    this.name,
    this.email,
    this.phone,
    this.nid,
    this.passport,
    this.occupation,
    this.institution,
    this.gender,
    this.userImage,
  });



  String? name;
  String? email;
  String? phone;
  String? nid;
  String? passport;
  String? occupation;
  String? institution;
  String? gender;
  File? userImage;


  Map<String, dynamic> toJson() => {
  "name": name,
  "email": email,
  "phone": phone,
  "nid": nid,
  "passport": passport,
  "occupation": occupation,
  "institution": institution,
  "gender": gender,
   "image":userImage
  };
}

