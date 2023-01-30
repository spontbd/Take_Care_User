import 'package:json_annotation/json_annotation.dart';

part 'provider_role.g.dart';
@JsonSerializable()
class Role {
  Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? guardName;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}