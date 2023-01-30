// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


UserDocuments _$UserDocumentsFromJson(Map<String, dynamic> json) =>
    UserDocuments(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      title: json['title'] as String?,
      extension: json['extension'] as String?,
      file: json['file'] as String?,
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );

Map<String, dynamic> _$UserDocumentsInfoToJson(UserDocuments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'title': instance.title,
      'file': instance.file,
      'extension': instance.extension,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
