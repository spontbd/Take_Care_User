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
  Data? data;

  factory AllServiceResponse.fromJson(Map<String, dynamic> json) => AllServiceResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

}

class Datum {
  Datum({
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
    this.userServiceId,
    this.providerId,
    this.servicePrice,
    this.bookingDate,
    this.serviceCategory,
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
  int? userServiceId;
  int? providerId;
  int? servicePrice;
  dynamic bookingDate;
  ServiceCategory? serviceCategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    serviceName: json["service_name"],
    serviceCategoryId: json["service_category_id"],
    serviceType: json["service_type"] == null ? null : json["service_type"],
    price: json["price"],
    description: json["description"],
    serviceImage: json["service_image"],
    serviceImageThumbnail: json["service_image_thumbnail"],
    imagePath: json["image_path"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userServiceId: json["user_service_id"],
    providerId: json["provider_id"],
    servicePrice: json["service_price"],
    bookingDate: json["booking_date"],
    serviceCategory: ServiceCategory.fromJson(json["service_category"]),
  );


}

class ServiceCategory {
  ServiceCategory({
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
  String? createdAt;
  String? updatedAt;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
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

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

}
