// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceOrderItem _$ServiceOrderItemFromJson(Map<String, dynamic> json) =>
    ServiceOrderItem(
      id: json['id'] as int?,
      invoiceNumber: json['invoice_number'] as String?,
      seekerId: json['seeker_id'] as int?,
      providerId: json['provider_id'] as int?,
      couponId: json['coupon_id'],
      couponDiscount: json['coupon_discount'] as int?,
      tax: json['tax'] as int?,
      subtotalPrice: json['subtotal_price'] as int?,
      orderNote: json['order_note'] as String?,
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      bookingDate: json['booking_date'] == null
          ? null
          : DateTime.parse(json['booking_date'] as String),
      bookingAddress: json['booking_address'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      orderStatus: json['order_status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      coupon: json['coupon'] as List<dynamic>?,
      seeker: json['seeker'] == null
          ? null
          : ProviderData.fromJson(json['seeker'] as Map<String, dynamic>),
      provider: json['provider'] == null
          ? null
          : ProviderData.fromJson(json['provider'] as Map<String, dynamic>),
      serviceOrderItemList: (json['service_order_items'] as List<dynamic>?)
          ?.map((e) => ServiceOrderItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceOrderItemToJson(ServiceOrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.invoiceNumber,
      'seeker_id': instance.seekerId,
      'provider_id': instance.providerId,
      'coupon_id': instance.couponId,
      'coupon_discount': instance.couponDiscount,
      'tax': instance.tax,
      'subtotal_price': instance.subtotalPrice,
      'order_note': instance.orderNote,
      'payment_method': instance.paymentMethod,
      'payment_status': instance.paymentStatus,
      'booking_date': instance.bookingDate?.toIso8601String(),
      'booking_address': instance.bookingAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'order_status': instance.orderStatus,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'coupon': instance.coupon,
      'seeker': instance.seeker,
      'provider': instance.provider,
      'service_order_items': instance.serviceOrderItemList,
    };
