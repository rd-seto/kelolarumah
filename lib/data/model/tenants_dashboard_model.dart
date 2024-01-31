// To parse this JSON data, do
//
//     final tenantsDashboardModel = tenantsDashboardModelFromJson(jsonString);

import 'dart:convert';

TenantsDashboardModel tenantsDashboardModelFromJson(String str) => TenantsDashboardModel.fromJson(json.decode(str));

String tenantsDashboardModelToJson(TenantsDashboardModel data) => json.encode(data.toJson());

class TenantsDashboardModel {
  bool? status;
  String? message;
  Data? data;

  TenantsDashboardModel({
    this.status,
    this.message,
    this.data,
  });

  factory TenantsDashboardModel.fromJson(Map<String, dynamic> json) => TenantsDashboardModel(
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
  TenantsStatistics? statistics;
  List<OrderHistory>? orderHistory;

  Data({
    this.statistics,
    this.orderHistory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    statistics: json["statistics"] == null ? null : TenantsStatistics.fromJson(json["statistics"]),
    orderHistory: json["order_history"] == null ? [] : List<OrderHistory>.from(json["order_history"]!.map((x) => OrderHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statistics": statistics?.toJson(),
    "order_history": orderHistory == null ? [] : List<dynamic>.from(orderHistory!.map((x) => x.toJson())),
  };
}

class OrderHistory {
  int? id;
  String? invoiceNo;
  DateTime? date;
  String? grandTotal;
  String? discountAmount;
  String? paidAmount;
  String? dueAmount;

  OrderHistory({
    this.id,
    this.invoiceNo,
    this.date,
    this.grandTotal,
    this.discountAmount,
    this.paidAmount,
    this.dueAmount,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
    id: json["id"],
    invoiceNo: json["invoice_no"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    grandTotal: json["grand_total"],
    discountAmount: json["discount_amount"],
    paidAmount: json["paid_amount"],
    dueAmount: json["due_amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoice_no": invoiceNo,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "grand_total": grandTotal,
    "discount_amount": discountAmount,
    "paid_amount": paidAmount,
    "due_amount": dueAmount,
  };
}

class TenantsStatistics {
  String? totalOrder;
  String? wishlist;
  String? purchaseAmount;
  String? usedCoupons;
  String? cart;
  String? completeOrder;

  TenantsStatistics({
    this.totalOrder,
    this.wishlist,
    this.purchaseAmount,
    this.usedCoupons,
    this.cart,
    this.completeOrder,
  });

  factory TenantsStatistics.fromJson(Map<String, dynamic> json) => TenantsStatistics(
    totalOrder: json["total_order"].toString(),
    wishlist: json["wishlist"].toString(),
    purchaseAmount: json["purchase_amount"].toString(),
    usedCoupons: json["used_coupons"].toString(),
    cart: json["cart"].toString(),
    completeOrder: json["complete_order"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "total_order": totalOrder,
    "wishlist": wishlist,
    "purchase_amount": purchaseAmount,
    "used_coupons": usedCoupons,
    "cart": cart,
    "complete_order": completeOrder,
  };
}
