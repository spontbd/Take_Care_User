import 'package:json_annotation/json_annotation.dart';
part 'language_proficiency.g.dart';
@JsonSerializable()
class LanguageProficiency {
  LanguageProficiency({
    this.id,
    this.user_id,
    this.language_name,
    this.language_marking,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? user_id;
  String? language_name;
  String? language_marking;
  dynamic created_at;
  dynamic updated_at;

  factory LanguageProficiency.fromJson(Map<String, dynamic> json) => _$LanguageProficiencyFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageProficiencyToJson(this);

}
