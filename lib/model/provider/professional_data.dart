import 'package:json_annotation/json_annotation.dart';

part 'professional_data.g.dart';

@JsonSerializable()
class ProfessionData {
  ProfessionData({
    this.id,
    this.user_id,
    this.license_no,
    this.year_of_experience,
    this.speciality,
    this.other_speciality,
    this.past_experience,
    this.personal_commitment,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? user_id;
  String? license_no;
  String? year_of_experience;
  String? speciality;
  String? other_speciality;
  String? personal_commitment;
  String? past_experience;
  dynamic created_at;
  dynamic updated_at;


  factory ProfessionData.fromJson(Map<String, dynamic> json) => _$ProfessionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionDataToJson(this);

}
