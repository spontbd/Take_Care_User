import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/app_data.dart';
part 'app_response.g.dart';
@JsonSerializable()
class AppResponse {
  AppResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  AppData? data;

  factory AppResponse.fromJson(Map<String, dynamic> json) => _$AppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}