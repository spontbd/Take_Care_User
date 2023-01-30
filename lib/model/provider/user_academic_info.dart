import 'package:json_annotation/json_annotation.dart';

part 'user_academic_info.g.dart';

@JsonSerializable()
class UserAcademicInfo {
  UserAcademicInfo({
    this.id,
    this.user_id,
    this.institute,
    this.major,
    this.passing_year,
    this.cgpa_grade,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? user_id;
  String? institute;
  String? major;
  String? passing_year;
  String? cgpa_grade;
  dynamic created_at;
  dynamic updated_at;


  factory UserAcademicInfo.fromJson(Map<String, dynamic> json) => _$UserAcademicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAcademicInfoToJson(this);



}