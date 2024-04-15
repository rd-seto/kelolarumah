// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  final bool status;
  final String message;
  final List<Datum> data;

  NotificationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String title;
  final String message;
  final int senderId;
  final int receiverId;
  final int isRead;
  final int createdBy;

  Datum({
    required this.id,
    required this.title,
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.isRead,
    required this.createdBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    isRead: json["is_read"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "is_read": isRead,
    "created_by": createdBy,
  };
}
