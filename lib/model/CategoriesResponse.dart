// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));


class CategoriesResponse {
  CategoriesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  Datum({
    this.id,
    this.categoryName,
    this.serviceImage,
    this.serviceThumbnail,
    this.serviceType,
    this.startPrice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? categoryName;
  String? serviceImage;
  String? serviceThumbnail;
  String? serviceType;
  int? startPrice;

  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryName: json["category_name"],
    serviceImage: json["service_image"],
    serviceThumbnail: json["service_thumbnail"],
    serviceType: json["service_type"],
    startPrice: json["start_price"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );


}
