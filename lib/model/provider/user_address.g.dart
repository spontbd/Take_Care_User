// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      district: json['district'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      lon: json['lon'] as String?,
      lat: json['lat'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'district': instance.district,
      'city': instance.city,
      'postcode': instance.postcode,
      'lon': instance.lon,
      'lat': instance.lat,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
