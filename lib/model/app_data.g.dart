// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
      invoiceNumber: json['invoice_number'] as String?,
      orderId: json['order_id'] as int?,
      request_number: json['request_number'] as String?,
      id: json['id'] as int?,
      serviceOrderId: json['serviceOrderId'] as int?,
      serviceId: json['serviceId'] as int?,
      servicePrice: json['servicePrice'] as int?,
      serviceCount: json['serviceCount'] as int?,
      serviceTotal: json['serviceTotal'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['userId'] as int?,
      status: json['status'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceCategoryId: json['serviceCategoryId'] as int?,
      serviceType: json['serviceType'] as String?,
      coupon: json['coupon'] as String?,
      coupon_type: json['coupon_type'] as String?,
      price: json['price'] as int?,
      discount: json['discount'] as int?,
      description: json['description'] as String?,
      serviceImage: json['serviceImage'] as String?,
      serviceImageThumbnail: json['serviceImageThumbnail'],
      imagePath: json['imagePath'],
      serviceOrder: json['serviceOrder'] == null
          ? null
          : ServiceOrder.fromJson(json['serviceOrder'] as Map<String, dynamic>),
      serviceOrderItems: (json['order_items'] as List<dynamic>?)
          ?.map((e) => ServiceOrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'order_id': instance.orderId,
      'request_number': instance.request_number,
      'id': instance.id,
      'serviceOrderId': instance.serviceOrderId,
      'serviceId': instance.serviceId,
      'servicePrice': instance.servicePrice,
      'serviceCount': instance.serviceCount,
      'serviceTotal': instance.serviceTotal,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userId': instance.userId,
      'status': instance.status,
      'serviceName': instance.serviceName,
      'serviceCategoryId': instance.serviceCategoryId,
      'serviceType': instance.serviceType,
      'price': instance.price,
      'description': instance.description,
      'serviceImage': instance.serviceImage,
      'serviceImageThumbnail': instance.serviceImageThumbnail,
      'imagePath': instance.imagePath,
      'serviceOrder': instance.serviceOrder,
      'order_items': instance.serviceOrderItems,
      'coupon': instance.coupon,
      'coupon_type': instance.coupon_type,
      'discount': instance.discount,
    };
