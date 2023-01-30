// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderItemList _$ServiceOrderItemListFromJson(
        Map<String, dynamic> json) =>
    ServiceOrderItemList(
      id: json['id'] as int?,
      serviceOrderId: json['service_order_id'] as int?,
      serviceId: json['service_id'] as int?,
      servicePrice: json['service_price'] as int?,
      serviceCount: json['service_count'] as int?,
      serviceTotal: json['service_total'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      service: json['service'] == null
          ? null
          : ServiceDetails.fromJson(json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceOrderItemListToJson(
        ServiceOrderItemList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_order_id': instance.serviceOrderId,
      'service_id': instance.serviceId,
      'service_price': instance.servicePrice,
      'service_count': instance.serviceCount,
      'service_total': instance.serviceTotal,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'service': instance.service,
    };
