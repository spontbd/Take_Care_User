// To parse this JSON data, do
//
//     final addCardResponse = addCardResponseFromJson(jsonString);

import 'dart:convert';

AddCardResponse addCardResponseFromJson(String str) => AddCardResponse.fromJson(json.decode(str));


class AddCardResponse {
  AddCardResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory AddCardResponse.fromJson(Map<String, dynamic> json) => AddCardResponse(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.userServiceId,
    this.bookingDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userService,
  });

  int? id;
  int? userId;
  int? userServiceId;
  DateTime? bookingDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  UserService? userService;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    userServiceId: json["user_service_id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userService: UserService.fromJson(json["user_service"]),
  );

}

class UserService {
  UserService({
    this.id,
    this.userId,
    this.serviceId,
    this.servicePrice,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? serviceId;
  int? servicePrice;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory UserService.fromJson(Map<String, dynamic> json) => UserService(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    servicePrice: json["service_price"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

}
