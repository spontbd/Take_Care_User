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
    this.serviceId,
    this.service,
  });

  dynamic id;
  dynamic userId;
  dynamic userServiceId;
  DateTime? bookingDate;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic serviceId;
  Service? service;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    userServiceId: json["user_service_id"],
    bookingDate: DateTime.parse(json["booking_date"]),
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    serviceId: json["service_id"],
    service: Service.fromJson(json["service"]),
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

  dynamic id;
  dynamic serviceName;
  dynamic serviceCategoryId;
  dynamic serviceType;
  dynamic price;
  dynamic description;
  dynamic serviceImage;
  dynamic serviceImageThumbnail;
  dynamic imagePath;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

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
