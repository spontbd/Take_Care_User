// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrder _$ServiceOrderFromJson(Map<String, dynamic> json) => ServiceOrder(
      id: json['id'] as int?,
      invoiceNumber: json['invoiceNumber'] as String?,
      seekerId: json['seekerId'] as int?,
      providerId: json['providerId'] as int?,
      couponId: json['couponId'] as int?,
      couponDiscount: json['couponDiscount'] as int?,
      tax: (json['tax'] as num?)?.toDouble(),
      subtotalPrice: (json['subtotalPrice'] as num?)?.toDouble(),
      orderNote: json['orderNote'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      paymentStatus: json['paymentStatus'] as String?,
      bookingDate: json['bookingDate'] == null
          ? null
          : DateTime.parse(json['bookingDate'] as String),
      bookingAddress: json['bookingAddress'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      orderStatus: json['orderStatus'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ServiceOrderToJson(ServiceOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'seekerId': instance.seekerId,
      'providerId': instance.providerId,
      'couponId': instance.couponId,
      'couponDiscount': instance.couponDiscount,
      'tax': instance.tax,
      'subtotalPrice': instance.subtotalPrice,
      'orderNote': instance.orderNote,
      'paymentMethod': instance.paymentMethod,
      'paymentStatus': instance.paymentStatus,
      'bookingDate': instance.bookingDate?.toIso8601String(),
      'bookingAddress': instance.bookingAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'orderStatus': instance.orderStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
