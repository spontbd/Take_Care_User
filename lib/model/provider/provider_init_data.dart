

import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';
import 'package:takecare_user/model/provider/language_proficiency.dart';
import 'package:takecare_user/model/provider/professional_data.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/model/provider/save_address.dart';
import 'package:takecare_user/model/provider/user_academic_info.dart';
import 'package:takecare_user/model/provider/user_address.dart';
import 'package:takecare_user/model/provider/user_documents.dart';

part 'provider_init_data.g.dart';
@JsonSerializable()
class ProviderInitData {
  ProviderInitData({
    this.provider_data
  });

  List<ProviderData>? provider_data;

  factory ProviderInitData.fromJson(Map<String, dynamic> json) => _$ProviderInitDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderInitDataToJson(this);
}