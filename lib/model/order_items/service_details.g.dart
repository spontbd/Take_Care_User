// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDetails _$ServiceDetailsFromJson(Map<String, dynamic> json) =>
    ServiceDetails(
      id: json['id'] as int?,
      serviceName: json['service_name'] as String?,
      serviceCategoryId: json['service_category_id'] as int?,
      serviceType: json['service_type'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      serviceImage: json['service_image'] as String?,
      serviceImageThumbnail: json['service_image_thumbnail'] as String?,
      imagePath: json['image_path'] as String?,
      sorting: json['sorting'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServiceDetailsToJson(ServiceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'service_category_id': instance.serviceCategoryId,
      'service_type': instance.serviceType,
      'price': instance.price,
      'description': instance.description,
      'service_image': instance.serviceImage,
      'service_image_thumbnail': instance.serviceImageThumbnail,
      'image_path': instance.imagePath,
      'sorting': instance.sorting,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
