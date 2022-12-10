// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
      invoiceNumber: json['invoice_number'] as String?,
      orderId: json['order_id'] as int?,
      request_number: json['request_number'] as String?,
    );

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
      'invoice_number': instance.invoiceNumber,
      'order_id': instance.orderId,
      'request_number': instance.request_number,
    };
