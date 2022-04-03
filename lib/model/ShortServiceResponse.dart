// To parse this JSON data, do
//
//     final shortServiceResponse = shortServiceResponseFromJson(jsonString);

import 'dart:convert';

ShortServiceResponse shortServiceResponseFromJson(String str) => ShortServiceResponse.fromJson(json.decode(str));


class ShortServiceResponse {
  ShortServiceResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory ShortServiceResponse.fromJson(Map<String, dynamic> json) => ShortServiceResponse(
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
  Service? service;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    serviceId: json["service_id"],
    servicePrice: json["service_price"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
  );

}

class Service {
  Service({
    this.id,
    this.serviceName,
    this.serviceCategoryId,
    this.serviceType,
    this.price,
    this.description,
    this.serviceImage,
    this.serviceImageThumbnail,
    this.imagePath,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? serviceName;
  int? serviceCategoryId;
  String? serviceType;
  int? price;
  String? description;
  String? serviceImage;
  String? serviceImageThumbnail;
  String? imagePath;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    serviceName: json["service_name"],
    serviceCategoryId: json["service_category_id"],
    serviceType: json["service_type"],
    price: json["price"],
    description: json["description"],
    serviceImage: json["service_image"],
    serviceImageThumbnail: json["service_image_thumbnail"],
    imagePath: json["image_path"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

}
