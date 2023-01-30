// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableProviderResponseNew _$AvailableProviderResponseFromJson(
        Map<String, dynamic> json) =>
    AvailableProviderResponseNew(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data:   json['data'] == null
    ? null
            : ProviderInitData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AvailableProviderResponseToJson(
    AvailableProviderResponseNew instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
