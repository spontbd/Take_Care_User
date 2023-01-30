import 'package:json_annotation/json_annotation.dart';
part 'service_details.g.dart';

@JsonSerializable()
class ServiceDetails
{
  ServiceDetails({
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
  int? sorting;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => _$ServiceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDetailsToJson(this);
}