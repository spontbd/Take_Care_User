import 'package:json_annotation/json_annotation.dart';
part 'provider_speciality.g.dart';
@JsonSerializable()
class Speciality {
  Speciality({
    this.id,
    this.specialityName,
    this.expertiseId,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? specialityName;
  int? expertiseId;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Speciality.fromJson(Map<String, dynamic> json) => _$SpecialityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityToJson(this);
}