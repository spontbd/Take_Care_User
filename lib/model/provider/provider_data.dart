

import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';

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
    this.longitude,
    this.latitude,
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
    this.provider_service_total_price,
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
  dynamic longitude;
  dynamic latitude;
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
  int? provider_service_total_price;
  Role? role;
  Speciality? speciality;

  factory ProviderData.fromJson(Map<String, dynamic> json) => _$ProviderDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderDataToJson(this);
}