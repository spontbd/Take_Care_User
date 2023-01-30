import 'package:json_annotation/json_annotation.dart';

part 'user_documents.g.dart';

@JsonSerializable()
class UserDocuments {
  UserDocuments({
    this.id,
    this.user_id,
    this.title,
    this.file,
    this.extension,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? user_id;
  String? title;
  String? file;
  String? extension;
  dynamic created_at;
  dynamic updated_at;


  factory UserDocuments.fromJson(Map<String, dynamic> json) => _$UserDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDocumentsInfoToJson(this);



}