// To parse this JSON data, do
//
//     final allServiceResponse = allServiceResponseFromJson(jsonString);

import 'dart:convert';

AllServiceResponse allServiceResponseFromJson(String str) => AllServiceResponse.fromJson(json.decode(str));


class AllServiceResponse {
  AllServiceResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Service>? data;

  factory AllServiceResponse.fromJson(Map<String, dynamic> json) => AllServiceResponse(
    success: json["success"],
    message: json["message"],
    data: List<Service>.from(json["data"].map((x) => Service.fromJson(x))),
  );

}

class Service {
  Service({
    this.id,
    this.serviceName,
    this.serviceCategoryId,
    this.price,
    this.description,
    this.serviceImage,
    this.serviceImageThumbnail,
    this.imagePath,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceCategory,
  });

  int? id;
  String? serviceName;
  int? serviceCategoryId;
  int? price;
  String? description;
  String? serviceImage;
  dynamic serviceImageThumbnail;
  dynamic imagePath;
  String? status;
  String? createdAt;
  String? updatedAt;
  ServiceCategory? serviceCategory;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    serviceName: json["service_name"],
    serviceCategoryId: json["service_category_id"],
    price: json["price"],
    description: json["description"],
    serviceImage: json["service_image"],
    serviceImageThumbnail: json["service_image_thumbnail"],
    imagePath: json["image_path"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    serviceCategory: ServiceCategory.fromJson(json["service_category"]),
  );

}

class ServiceCategory {
  ServiceCategory({
    required this.id,
    this.categoryName,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String? categoryName;
  String? createdAt;
  String? updatedAt;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json["id"],
    categoryName: json["category_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );


}
