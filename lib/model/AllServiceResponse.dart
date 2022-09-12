// To parse this JSON data, do
//
//     final allServiceResponse = allServiceResponseFromJson(jsonString);

import 'dart:convert';

/*
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
  List<AllServiceData>? data;
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
    data: List<AllServiceData>.from(json["data"].map((x) => AllServiceData.fromJson(x))),
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

class AllServiceData {
  AllServiceData({
    this.id,
    this.serviceName,
    this.serviceCategoryId,
    this.serviceType,
    this.price,
    this.description,
    this.serviceImage,
    this.serviceImageThumbnail,
    this.imagePath,
    this.sorting,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.bookingDate,
    this.addedInMyService,
    this.addedInMyCart,
    this.serviceCat,

  });

  int? id;
  String? serviceName;
  int? serviceCategoryId;
  dynamic serviceType;
  int? price;
  String? description;
  String? serviceImage;
  String? serviceImageThumbnail;
  String? imagePath;
  dynamic sorting;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? bookingDate;
  dynamic addedInMyService;
  dynamic addedInMyCart;
  List<ServiceCat>? serviceCat;

  factory AllServiceData.fromJson(Map<String, dynamic> json) => AllServiceData(
    id: json["id"],
    serviceName: json["service_name"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    serviceType: json["service_type"],
    price: json["price"],
    description: json["description"],
    serviceImage: json["service_image"],
    serviceImageThumbnail: json["service_image_thumbnail"],
    imagePath: json["image_path"],
    sorting: json["sorting"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
    addedInMyService: json["added_in_my_service"],
    addedInMyCart: json["added_in_my_cart"],
    serviceCat: List<ServiceCat>.from(json["service_cats"].map((x) => ServiceCategory.fromJson(x))),
  );


}


class ServiceCat {
  ServiceCat({
    this.id,
    this.serviceId,
    this.categoryId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.serviceCategory,
  });

  int? id;
  int? serviceId;
  int? categoryId;
  dynamic createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceCategory? serviceCategory;

  factory ServiceCat.fromJson(Map<String, dynamic> json) => ServiceCat(
    id: json["id"],
    serviceId: json["service_id"],
    categoryId: json["category_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    this.isPopular,
    this.startPrice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic categoryName;
  String? serviceImage;
  String? serviceThumbnail;
  dynamic serviceType;
  int? isPopular;
  int? startPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json["id"],
    categoryName: json["category_name"],
    serviceImage: json["service_image"],
    serviceThumbnail: json["service_thumbnail"],
    serviceType: json["service_type"],
    isPopular: json["is_popular"],
    startPrice: json["start_price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
*/


// To parse this JSON data, do
//
//     final allServiceResponse = allServiceResponseFromJson(jsonString);


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
  List<AllServiceData>? data;
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
    data: List<AllServiceData>.from(json["data"].map((x) => AllServiceData.fromJson(x))),
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

class AllServiceData {
  AllServiceData({
    this.id,
    this.serviceName,
    this.serviceCategoryId,
    this.serviceType,
    this.price,
    this.description,
    this.serviceImage,
    this.serviceImageThumbnail,
    this.imagePath,
    this.sorting,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.bookingDate,
    this.addedInMyService,
    this.addedInMyCart,
    this.serviceCats,
  });

  int? id;
  String? serviceName;
  int? serviceCategoryId;
  dynamic? serviceType;
  int? price;
  String? description;
  String? serviceImage;
  String? serviceImageThumbnail;
  String? imagePath;
  dynamic sorting;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? bookingDate;
  dynamic addedInMyService;
  dynamic addedInMyCart;
  List<ServiceCat>? serviceCats;

  factory AllServiceData.fromJson(Map<String, dynamic> json) => AllServiceData(
    id: json["id"],
    serviceName: json["service_name"],
    serviceCategoryId: json["service_category_id"] == null ? null : json["service_category_id"],
    serviceType: json["service_type"],
    price: json["price"],
    description: json["description"],
    serviceImage: json["service_image"],
    serviceImageThumbnail: json["service_image_thumbnail"],
    imagePath: json["image_path"],
    sorting: json["sorting"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bookingDate: json["booking_date"] == null ? null : DateTime.parse(json["booking_date"]),
    addedInMyService: json["added_in_my_service"],
    addedInMyCart: json["added_in_my_cart"],
    serviceCats: List<ServiceCat>.from(json["service_cats"].map((x) => ServiceCat.fromJson(x))),
  );
}

class ServiceCat {
  ServiceCat({
    this.id,
    this.serviceId,
    this.categoryId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.serviceCategory,
  });

  int? id;
  int? serviceId;
  int? categoryId;
  dynamic createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceCategory? serviceCategory;

  factory ServiceCat.fromJson(Map<String, dynamic> json) => ServiceCat(
    id: json["id"],
    serviceId: json["service_id"],
    categoryId: json["category_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    this.isPopular,
    this.startPrice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? categoryName;
  String? serviceImage;
  String? serviceThumbnail;
  dynamic serviceType;
  int? isPopular;
  int? startPrice;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json["id"],
    categoryName: json["category_name"],
    serviceImage: json["service_image"],
    serviceThumbnail: json["service_thumbnail"],
    serviceType:json["service_type"],
    isPopular: json["is_popular"],
    startPrice: json["start_price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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

