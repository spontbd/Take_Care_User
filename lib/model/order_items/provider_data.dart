import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/provider/provider_role.dart';

import '../provider/provider_speciality.dart';

part 'provider_data.g.dart';
@JsonSerializable()
class ProviderData {
  ProviderData({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.roleId,
    this.userSlug,
    this.profilePhoto,
    this.specialityId,
    this.expertiseId,
    this.wight,
    this.height,
    this.emailVerifiedAt,
    this.otpVerified,
    this.documentsVerified,
    this.status,
    this.lastLogin,
    this.available,
    this.fcmToken,
    this.signatureOtp,
    this.firebaseToken,
    this.createdAt,
    this.updatedAt,
    this.providerNumberOfGivenServiceCount,
    this.role,
    this.speciality,
  });

  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  int? roleId;
  String? userSlug;
  String? profilePhoto;
  int? specialityId;
  dynamic expertiseId;
  int? wight;
  String? height;
  dynamic emailVerifiedAt;
  int? otpVerified;
  int? documentsVerified;
  int? status;
  dynamic lastLogin;
  int? available;
  String? fcmToken;
  dynamic signatureOtp;
  dynamic firebaseToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? providerNumberOfGivenServiceCount;
  Role? role;
  Speciality? speciality;

  factory ProviderData.fromJson(Map<String, dynamic> json) => _$ProviderDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderDataToJson(this);
}