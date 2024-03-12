// To parse this JSON data, do
//
//     final tenantPropertyDetailsModel = tenantPropertyDetailsModelFromJson(jsonString);

import 'dart:convert';

TenantPropertyDetailsModel tenantPropertyDetailsModelFromJson(String str) =>
    TenantPropertyDetailsModel.fromJson(json.decode(str));

String tenantPropertyDetailsModelToJson(TenantPropertyDetailsModel data) =>
    json.encode(data.toJson());

class TenantPropertyDetailsModel {
  final bool? status;
  final String? message;
  final Data? data;

  TenantPropertyDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantPropertyDetailsModel.fromJson(Map<String, dynamic> json) =>
      TenantPropertyDetailsModel(
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
  final Advertisement? advertisement;
  final Property? property;
  final Address? address;
  final List<Gallery>? galleries;
  final FloorPlans? floorPlans;
  final User? user;
  final List<Tenant>? tenants;
  final List<CurrentTenant>? currentTenant;
  final List<dynamic>? facilities;
  final Category? category;
  final dynamic document;
  final List<dynamic>? propertyReviews;

  Data(
      {this.advertisement,
      this.property,
      this.address,
      this.galleries,
      this.floorPlans,
      this.user,
      this.tenants,
      this.facilities,
      this.category,
      this.document,
      this.propertyReviews,
      this.currentTenant});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        advertisement: json["advertisement"] == null
            ? null
            : Advertisement.fromJson(json["advertisement"]),
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        galleries: json["galleries"] == null
            ? []
            : List<Gallery>.from(
                json["galleries"]!.map((x) => Gallery.fromJson(x))),
        floorPlans: json["floorPlans"] == null
            ? null
            : FloorPlans.fromJson(json["floorPlans"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        tenants: json["tenants"] == null
            ? []
            : List<Tenant>.from(
                json["tenants"]!.map((x) => Tenant.fromJson(x))),
        currentTenant: json["current_tenant"] == null
            ? []
            : List<CurrentTenant>.from(
                json["current_tenant"]!.map((x) => CurrentTenant.fromJson(x))),
        facilities: json["facilities"] == null
            ? []
            : List<dynamic>.from(json["facilities"]!.map((x) => x)),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        document: json["document"],
        propertyReviews: json["property_reviews"] == null
            ? []
            : List<dynamic>.from(json["property_reviews"]!.map((x) => x)),

      );

  Map<String, dynamic> toJson() => {
        "advertisement": advertisement?.toJson(),
        "property": property?.toJson(),
        "address": address?.toJson(),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "floorPlans": floorPlans?.toJson(),
        "user": user?.toJson(),
        "tenants": tenants == null
            ? []
            : List<dynamic>.from(tenants!.map((x) => x.toJson())),
        "facilities": facilities == null
            ? []
            : List<dynamic>.from(facilities!.map((x) => x)),
        "category": category?.toJson(),
        "document": document,
        "property_reviews": propertyReviews == null
            ? []
            : List<dynamic>.from(propertyReviews!.map((x) => x)),

      };
}

class Address {
  final int? id;
  final String? country;
  final dynamic latitude;
  final dynamic longitude;
  final String? address;

  Address({
    this.id,
    this.country,
    this.latitude,
    this.longitude,
    this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        country: json["country"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
      };
}

class Advertisement {
  final int? id;
  final int? userId;
  final int? propertyId;
  final int? propertyCreatorId;
  final int? advertisementType;
  final double? bookingAmount;
  final dynamic rentAmount;
  final dynamic rentType;
  final dynamic rentStartDate;
  final dynamic rentEndDate;
  final dynamic maxMember;
  final dynamic mortgageAmount;
  final dynamic mortgageDuration;
  final dynamic leaseAmount;
  final dynamic leaseDuration;
  final dynamic caretakerDuration;
  final dynamic sellAmount;
  final dynamic sellStartDate;
  final int? negotiable;
  final int? status;
  final int? approvalStatus;
  final dynamic approvedBy;
  final dynamic approvedAt;
  final String? termsCondition;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Advertisement({
    this.id,
    this.userId,
    this.propertyId,
    this.propertyCreatorId,
    this.advertisementType,
    this.bookingAmount,
    this.rentAmount,
    this.rentType,
    this.rentStartDate,
    this.rentEndDate,
    this.maxMember,
    this.mortgageAmount,
    this.mortgageDuration,
    this.leaseAmount,
    this.leaseDuration,
    this.caretakerDuration,
    this.sellAmount,
    this.sellStartDate,
    this.negotiable,
    this.status,
    this.approvalStatus,
    this.approvedBy,
    this.approvedAt,
    this.termsCondition,
    this.createdAt,
    this.updatedAt,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
        id: json["id"],
        userId: json["user_id"],
        propertyId: json["property_id"],
        propertyCreatorId: json["property_creator_id"],
        advertisementType: json["advertisement_type"],
        bookingAmount: json["booking_amount"]?.toDouble(),
        rentAmount: json["rent_amount"],
        rentType: json["rent_type"],
        rentStartDate: json["rent_start_date"],
        rentEndDate: json["rent_end_date"],
        maxMember: json["max_member"],
        mortgageAmount: json["mortgage_amount"],
        mortgageDuration: json["mortgage_duration"],
        leaseAmount: json["lease_amount"],
        leaseDuration: json["lease_duration"],
        caretakerDuration: json["caretaker_duration"],
        sellAmount: json["sell_amount"],
        sellStartDate: json["sell_start_date"],
        negotiable: json["negotiable"],
        status: json["status"],
        approvalStatus: json["approval_status"],
        approvedBy: json["approved_by"],
        approvedAt: json["approved_at"],
        termsCondition: json["terms_condition"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "property_id": propertyId,
        "property_creator_id": propertyCreatorId,
        "advertisement_type": advertisementType,
        "booking_amount": bookingAmount,
        "rent_amount": rentAmount,
        "rent_type": rentType,
        "rent_start_date": rentStartDate,
        "rent_end_date": rentEndDate,
        "max_member": maxMember,
        "mortgage_amount": mortgageAmount,
        "mortgage_duration": mortgageDuration,
        "lease_amount": leaseAmount,
        "lease_duration": leaseDuration,
        "caretaker_duration": caretakerDuration,
        "sell_amount": sellAmount,
        "sell_start_date": sellStartDate,
        "negotiable": negotiable,
        "status": status,
        "approval_status": approvalStatus,
        "approved_by": approvedBy,
        "approved_at": approvedAt,
        "terms_condition": termsCondition,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class FloorPlans {
  final Gallery? the10;

  FloorPlans({
    this.the10,
  });

  factory FloorPlans.fromJson(Map<String, dynamic> json) => FloorPlans(
        the10: json["10"] == null ? null : Gallery.fromJson(json["10"]),
      );

  Map<String, dynamic> toJson() => {
        "10": the10?.toJson(),
      };
}

class Gallery {
  final int? id;
  final String? name;
  final String? image;

  Gallery({
    this.id,
    this.name,
    this.image,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Property {
  final int? id;
  final String? name;
  final String? image;
  final String? dealType;
  final String? type;
  final String? completion;
  final int? totalUnit;
  final int? totalOccupied;
  final int? totalRent;
  final int? totalSell;
  final String? size;
  final String? diningCombined;
  final int? bedroom;
  final int? bathroom;
  final dynamic rentType;
  final int? discountAmount;
  final String? discountType;
  final double? bookingAmount;
  final String? flatNo;
  final String? description;
  final String? category;
  final String? userEmail;
  final String? userPhone;
  final String? address;
  final bool? wishlist;

  Property({
    this.id,
    this.name,
    this.image,
    this.dealType,
    this.type,
    this.completion,
    this.totalUnit,
    this.totalOccupied,
    this.totalRent,
    this.totalSell,
    this.size,
    this.diningCombined,
    this.bedroom,
    this.bathroom,
    this.rentType,
    this.discountAmount,
    this.discountType,
    this.bookingAmount,
    this.flatNo,
    this.description,
    this.category,
    this.userEmail,
    this.userPhone,
    this.wishlist,
    this.address,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        dealType: json["deal_type"],
        type: json["type"],
        completion: json["completion"],
        totalUnit: json["total_unit"],
        totalOccupied: json["total_occupied"],
        totalRent: json["total_rent"],
        totalSell: json["total_sell"],
        size: json["size"],
        diningCombined: json["dining_combined"],
        bedroom: json["bedroom"],
        bathroom: json["bathroom"],
        rentType: json["rent_type"],
        discountAmount: json["discount_amount"],
        discountType: json["discount_type"],
        bookingAmount: json["booking_amount"]?.toDouble(),
        flatNo: json["flat_no"],
        description: json["description"],
        category: json["category"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        wishlist: json["wishlist"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "deal_type": dealType,
        "type": type,
        "completion": completion,
        "total_unit": totalUnit,
        "total_occupied": totalOccupied,
        "total_rent": totalRent,
        "total_sell": totalSell,
        "size": size,
        "dining_combined": diningCombined,
        "bedroom": bedroom,
        "bathroom": bathroom,
        "rent_type": rentType,
        "discount_amount": discountAmount,
        "discount_type": discountType,
        "booking_amount": bookingAmount,
        "flat_no": flatNo,
        "description": description,
        "category": category,
        "user_email": userEmail,
        "user_phone": userPhone,
        "wishlist": wishlist,
        "address": address,
      };
}

class Tenant {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final DateTime? createdAt;
  final String? address;

  Tenant({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.createdAt,
    this.address,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "photo": photo,
        "created_at": createdAt?.toIso8601String(),
        "address": address,
      };
}

class CurrentTenant {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final DateTime? createdAt;
  final String? presentAddress;

  CurrentTenant({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.createdAt,
    this.presentAddress,
  });

  factory CurrentTenant.fromJson(Map<String, dynamic> json) => CurrentTenant(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        presentAddress: json["present_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": photo,
        "created_at": createdAt?.toIso8601String(),
        "present_address": presentAddress,
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
      };
}
