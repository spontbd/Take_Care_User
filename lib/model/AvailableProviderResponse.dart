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
    this.firebaseToken,
    this.createdAt,
    this.updatedAt,
    this.role,
  });

  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  int? roleId;
  String? userSlug;
  String? profilePhoto;
  dynamic specialityId;
  int? expertiseId;
  int? wight;
  String? height;
  String? emailVerifiedAt;
  int? otpVerified;
  int? documentsVerified;
  int? status;
  dynamic lastLogin;
  int? available;
  dynamic firebaseToken;
  String? createdAt;
  String? updatedAt;
  Role? role;

  factory Providerdata.fromJson(Map<String, dynamic> json) => Providerdata(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    roleId: json["role_id"],
    userSlug: json["user_slug"],
    profilePhoto: json["profile_photo"] == null ? null : json["profile_photo"],
    specialityId: json["speciality_id"],
    expertiseId: json["expertise_id"] == null ? null : json["expertise_id"],
    wight: json["wight"] == null ? null : json["wight"],
    height: json["height"] == null ? null : json["height"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : json["email_verified_at"],
    otpVerified: json["otp_verified"],
    documentsVerified: json["documents_verified"],
    status: json["status"],
    lastLogin: json["last_login"],
    available: json["available"],
    firebaseToken: json["firebase_token"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    role: Role.fromJson(json["role"]),
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
  String? createdAt;
  String? updatedAt;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    guardName: json["guard_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

}
