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
  List<CategoriesData>? data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    success: json["success"],
    message: json["message"],
    data: List<CategoriesData>.from(json["data"].map((x) => CategoriesData.fromJson(x))),
  );


}

class CategoriesData {
  CategoriesData({
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

  factory CategoriesData.fromJson(Map<String, dynamic> json) => CategoriesData(
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
