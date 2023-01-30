import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/model/provider/provider_init_data.dart';

part 'provider_response.g.dart';
@JsonSerializable()
class AvailableProviderResponseNew {
  AvailableProviderResponseNew({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  ProviderInitData? data;

  factory AvailableProviderResponseNew.fromJson(Map<String, dynamic> json) => _$AvailableProviderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableProviderResponseToJson(this);
}



