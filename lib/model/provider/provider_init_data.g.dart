// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_init_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderInitData _$ProviderInitDataFromJson(Map<String, dynamic> json) => ProviderInitData(
  provider_data : (json['data'] as List<dynamic>?)
      ?.map((e) => ProviderData.fromJson(e as Map<String, dynamic>))
      .toList(),

 );

Map<String, dynamic> _$ProviderInitDataToJson(ProviderInitData instance) =>
    <String, dynamic>{
      'data': instance.provider_data,
    };
