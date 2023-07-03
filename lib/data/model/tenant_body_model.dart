import 'dart:io';

class TenantBodyModel {

  String? name;
  String? email;
  String? phone;
  String? propertyId;
  String? moveIn;
  String? moveOut;
  String? advanceAmount;
  String? rentAmount;
  String? rentType;
  File? document;

  TenantBodyModel(
      {this.name,
      this.email,
      this.phone,
      this.propertyId,
      this.moveIn,
      this.moveOut,
      this.advanceAmount,
      this.rentAmount,
      this.rentType,
      this.document});

  Map<String, dynamic> toJson() => {

        "name": name,
        "email": email,
        "phone": phone,
        "property_id": propertyId,
        "move_in": moveIn,
        "move_out": moveOut,
        "advance_amount": advanceAmount,
        "rent_amount": rentAmount,
        "rent_type": rentType,
        // "document": document
        "document": document
      };
}

class TenantProperty {
  final int? id;
  final String? name;

  TenantProperty({this.id, this.name});

  factory TenantProperty.fromJson(Map<String, dynamic> json) {
    return TenantProperty(id: json['id'], name: json['name']);
  }
}
