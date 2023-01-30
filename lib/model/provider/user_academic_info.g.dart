// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_academic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAcademicInfo _$UserAcademicInfoFromJson(Map<String, dynamic> json) =>
    UserAcademicInfo(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      institute: json['institute'] as String?,
      major: json['major'] as String?,
      passing_year: json['passing_year'] as String?,
      cgpa_grade: json['cgpa_grade'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$UserAcademicInfoToJson(UserAcademicInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'institute': instance.institute,
      'major': instance.major,
      'passing_year': instance.passing_year,
      'cgpa_grade': instance.cgpa_grade,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
