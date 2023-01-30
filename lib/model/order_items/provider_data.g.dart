// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderData _$ProviderDataFromJson(Map<String, dynamic> json) => ProviderData(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      roleId: json['roleId'] as int?,
      userSlug: json['userSlug'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      specialityId: json['specialityId'] as int?,
      expertiseId: json['expertiseId'],
      wight: json['wight'] as int?,
      height: json['height'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'],
      otpVerified: json['otpVerified'] as int?,
      documentsVerified: json['documentsVerified'] as int?,
      status: json['status'] as int?,
      lastLogin: json['lastLogin'],
      available: json['available'] as int?,
      fcmToken: json['fcmToken'] as String?,
      signatureOtp: json['signatureOtp'],
      firebaseToken: json['firebaseToken'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      providerNumberOfGivenServiceCount:
          json['providerNumberOfGivenServiceCount'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      speciality: json['speciality'] == null
          ? null
          : Speciality.fromJson(json['speciality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProviderDataToJson(ProviderData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'roleId': instance.roleId,
      'userSlug': instance.userSlug,
      'profilePhoto': instance.profilePhoto,
      'specialityId': instance.specialityId,
      'expertiseId': instance.expertiseId,
      'wight': instance.wight,
      'height': instance.height,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'otpVerified': instance.otpVerified,
      'documentsVerified': instance.documentsVerified,
      'status': instance.status,
      'lastLogin': instance.lastLogin,
      'available': instance.available,
      'fcmToken': instance.fcmToken,
      'signatureOtp': instance.signatureOtp,
      'firebaseToken': instance.firebaseToken,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'providerNumberOfGivenServiceCount':
          instance.providerNumberOfGivenServiceCount,
      'role': instance.role,
      'speciality': instance.speciality,
    };
