// To parse this JSON data, do
//
//     final userServiceResponse = userServiceResponseFromJson(jsonString);

import 'dart:convert';

UserServiceResponse userServiceResponseFromJson(String str) => UserServiceResponse.fromJson(json.decode(str));


class UserServiceResponse {
  UserServiceResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory UserServiceResponse.fromJson(Map<String, dynamic> json) => UserServiceResponse(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.serviceId,
    this.servicePrice,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int? id;
  int? userId;
  int? serviceId;
  int? servicePrice;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic service;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    servicePrice: json["service_price"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    service: json["service"],
  );


}
