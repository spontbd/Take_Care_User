// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse _$AppResponseFromJson(Map<String, dynamic> json) => AppResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AppData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppResponseToJson(AppResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
