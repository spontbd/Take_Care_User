// To parse this JSON data, do
//
//     final availableProviderResponse = availableProviderResponseFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final availableProviderResponse = availableProviderResponseFromJson(jsonString);

import 'dart:convert';

AvailableProviderResponse availableProviderResponseFromJson(String str) => AvailableProviderResponse.fromJson(json.decode(str));
class AvailableProviderResponse {
  AvailableProviderResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Providerdata>? data;

  factory AvailableProviderResponse.fromJson(Map<String, dynamic> json) => AvailableProviderResponse(
    success: json["success"],
    message: json["message"],
    data: List<Providerdata>.from(json["data"].map((x) => Providerdata.fromJson(x))),
  );

}
class Providerdata {
  Providerdata({
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
    this.userServices,
    this.destination,
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
  dynamic status;
  dynamic lastLogin;
  int? available;
  dynamic fcmToken;
  String? signatureOtp;
  dynamic firebaseToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? providerNumberOfGivenServiceCount;
  Role? role;
  List<dynamic>? speciality;
  List<UserService>? userServices;
  int? destination;

  factory Providerdata.fromJson(Map<dynamic, dynamic> json) => Providerdata(
    id: json["id"] == null ? null : json["id"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    gender: json["gender"] == null ? null : json["gender"],
    roleId: json["role_id"] == null ? null : json["role_id"],
    userSlug: json["user_slug"] == null ? null : json["user_slug"],
    profilePhoto: json["profile_photo"] == null ? null : json["profile_photo"],
    specialityId: json["speciality_id"] == null ? null : json["speciality_id"],
    expertiseId: json["expertise_id"],
    wight: json["wight"] == null ? null : json["wight"],
    height: json["height"] == null ? null : json["height"],
    emailVerifiedAt: json["email_verified_at"],
    otpVerified: json["otp_verified"] == null ? null : json["otp_verified"],
    documentsVerified: json["documents_verified"] == null ? null : json["documents_verified"],
    status: json["status"] == null ? null : json["status"],
    lastLogin: json["last_login"],
    available: json["available"] == null ? null : json["available"],
    fcmToken: json["fcm_token"],
    signatureOtp: json["signature_otp"] == null ? null : json["signature_otp"],
    firebaseToken: json["firebase_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    providerNumberOfGivenServiceCount: json["provider_number_of_given_service_count"] == null ? null : json["provider_number_of_given_service_count"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    speciality: json["speciality"] == null ? null : List<dynamic>.from(json["speciality"]!.map((x) => Speciality.fromJson(x))),

    // speciality: json["speciality"] == null ? null : Speciality.fromJson(json["speciality"]),
    userServices: json["user_services"] == null ? null : List<UserService>.from(json["user_services"].map((x) => UserService.fromJson(x))),
    destination: json["destination"] == null ? null : json["destination"],
  );
}
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

  factory Role.fromJson(Map<dynamic, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
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
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
    id: json["id"],
    specialityName: json["speciality_name"],
    expertiseId: json["expertise_id"],
    description: json["description"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
class UserService {
  UserService({
    this.id,
    this.userId,
    this.serviceId,
    this.servicePrice,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? serviceId;
  int? servicePrice;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserService.fromJson(Map<String, dynamic> json) => UserService(
    id: json["id"] ?? '',
    userId: json["user_id"]?? '' ,
    serviceId: json["service_id"]??'',
    servicePrice: json["service_price"]??'',
    status: json["status"]??'',
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
