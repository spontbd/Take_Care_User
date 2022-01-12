// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

class RegisterResponse {
  RegisterResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: json["success"],
        message: json["message"],
      );
}

class Data {
  Data({
    this.user,
  });

  User? user;


}

class User {
  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.roleId,
    this.userSlug,
    this.profilePhoto,
    this.emailVerifiedAt,
    this.otpVerified,
    this.documentsVerified,
    this.status,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? fullName;
  dynamic email;
  String? phone;
  String? gender;
  int? roleId;
  String? userSlug;
  dynamic profilePhoto;
  dynamic emailVerifiedAt;
  int? otpVerified;
  int? documentsVerified;
  int? status;
  dynamic lastLogin;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        roleId: json["role_id"],
        userSlug: json["user_slug"],
        profilePhoto: json["profile_photo"],
        emailVerifiedAt: json["email_verified_at"],
        otpVerified: json["otp_verified"],
        documentsVerified: json["documents_verified"],
        status: json["status"],
        lastLogin: json["last_login"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "gender": gender,
        "role_id": roleId,
        "user_slug": userSlug,
        "profile_photo": profilePhoto,
        "email_verified_at": emailVerifiedAt,
        "otp_verified": otpVerified,
        "documents_verified": documentsVerified,
        "status": status,
        "last_login": lastLogin,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
