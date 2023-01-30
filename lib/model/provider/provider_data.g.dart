// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderData _$ProviderDataFromJson(Map<String, dynamic> json) => ProviderData(
    id: json['id'] as int?,
    fullName: json['full_name'] as String?,
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
    longitude: json['longitude'],
    latitude: json['latitude'],
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
        json['provider_number_of_given_service_count'] as int?,
  provider_rating:
        json['provider_rating'] as int?,
    provider_service_total_price: json['provider_service_total_price'] as int?,
    role: json['role'] == null
        ? null
        : Role.fromJson(json['role'] as Map<String, dynamic>),
    speciality: json['speciality'] == null
        ? null
        : Speciality.fromJson(json['speciality'] as Map<String, dynamic>),
      professionData: (json['profession_data'] as List<dynamic>?)
          ?.map((e) => ProfessionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      saveAddress: (json['save_addresses'] as List<dynamic>?)
          ?.map((e) => SaveAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      academicInfo: (json['user_academic_infos'] as List<dynamic>?)
          ?.map((e) => UserAcademicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: (json['user_address'] as List<dynamic>?)
          ?.map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
  user_documents : (json['user_documents'] as List<dynamic>?)
          ?.map((e) => UserDocuments.fromJson(e as Map<String, dynamic>))
          .toList(),
      languageProficiency: (json['language_proficiency'] as List<dynamic>?)
          ?.map((e) => LanguageProficiency.fromJson(e as Map<String, dynamic>))
          .toList(),);

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
      'longitude': instance.longitude,
      'latitude': instance.latitude,
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
      'provider_number_of_given_service_count':
          instance.providerNumberOfGivenServiceCount,
      'provider_service_total_price': instance.provider_service_total_price,
      'role': instance.role,
      'speciality': instance.speciality,
      'provider_rating': instance.provider_rating,
      'language_proficiency': instance.languageProficiency,
      'profession_data': instance.professionData,
      'save_addresses': instance.saveAddress,
      'user_academic_infos': instance.academicInfo,
      'user_address': instance.address,
      'user_documents': instance.user_documents,
    };
