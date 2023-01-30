// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) => Speciality(
      id: json['id'] as int?,
      specialityName: json['specialityName'] as String?,
      expertiseId: json['expertiseId'] as int?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialityName': instance.specialityName,
      'expertiseId': instance.expertiseId,
      'description': instance.description,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
