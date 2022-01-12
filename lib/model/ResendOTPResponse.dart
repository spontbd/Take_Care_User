// To parse this JSON data, do
//
//     final resentResponse = resentResponseFromJson(jsonString);

import 'dart:convert';

ResendOTPResponse resendOTPResponseFromJson(String str) => ResendOTPResponse.fromJson(json.decode(str));

String resendOTPResponseToJson(ResendOTPResponse data) => json.encode(data.toJson());

class ResendOTPResponse {
  ResendOTPResponse({
     this.success,
     this.message,
     this.data,
  });

  var success;
  var message;
  var data;

  factory ResendOTPResponse.fromJson(Map<String, dynamic> json) => ResendOTPResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.phone,
    required this.otpVerified,
  });

  int id;
  String phone;
  int otpVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    phone: json["phone"],
    otpVerified: json["otp_verified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "otp_verified": otpVerified,
  };
}
