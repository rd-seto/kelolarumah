
class TenantEditBodyModel {
  TenantEditBodyModel({
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
  });

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

  Map<String, dynamic> toJson() => {
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
  };
}
