class TenantModel {
  TenantModel({
    this.tenants,
    this.total,
    this.active,
    this.inActive,
  });

  List<Tenant>? tenants;
  int? total;
  int? active;
  int? inActive;

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        tenants: json["data"]["items"]["list"] == null
            ? []
            : List<Tenant>.from(
                json["data"]["items"]["list"]!.map((x) => Tenant.fromJson(x))),
        total: json["data"]['statistics']["total"],
        active: json["data"]['statistics']["active"],
        inActive: json["data"]['statistics']["inactive"],
      );
}

class Tenant {
  Tenant(
      {this.id,
      this.name,
      this.email,
      this.propertyName,
      this.propertyAddress,
      this.phone,
      this.image});

  int? id;
  String? name;
  String? email;
  String? propertyName;
  String? propertyAddress;
  String? phone;
  String? image;

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      propertyName: json["property_name"],
      propertyAddress: json["property_address"],
      phone: json["phone"],
      image: json["image"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "property_name": propertyName,
        "property_address": propertyAddress,
        "phone": phone,
      };
}
