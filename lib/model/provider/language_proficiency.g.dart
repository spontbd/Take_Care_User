// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_proficiency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageProficiency _$LanguageProficiencyFromJson(Map<String, dynamic> json) =>
    LanguageProficiency(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      language_name: json['language_name'] as String?,
      language_marking: json['language_marking'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$LanguageProficiencyToJson(
        LanguageProficiency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'language_name': instance.language_name,
      'language_marking': instance.language_marking,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
