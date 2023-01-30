// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionData _$ProfessionDataFromJson(Map<String, dynamic> json) =>
    ProfessionData(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      license_no: json['license_no'] as String?,
      year_of_experience: json['year_of_experience'] as String?,
      speciality: json['speciality'] as String?,
      other_speciality: json['other_speciality'] as String?,
      personal_commitment: json['personal_commitment'] as String?,
      past_experience: json['past_experience'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$ProfessionDataToJson(ProfessionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'license_no': instance.license_no,
      'year_of_experience': instance.year_of_experience,
      'speciality': instance.speciality,
      'other_speciality': instance.other_speciality,
      'personal_commitment': instance.personal_commitment,
      'past_experience': instance.past_experience,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
