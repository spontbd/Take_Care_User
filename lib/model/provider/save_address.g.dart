// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveAddress _$SaveAddressFromJson(Map<String, dynamic> json) => SaveAddress(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      beneficiary_name: json['beneficiary_name'] as String?,
      district: json['district'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      lon: json['lon'] as String?,
      lat: json['lat'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$SaveAddressToJson(SaveAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'beneficiary_name': instance.beneficiary_name,
      'district': instance.district,
      'city': instance.city,
      'postcode': instance.postcode,
      'lon': instance.lon,
      'lat': instance.lat,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
