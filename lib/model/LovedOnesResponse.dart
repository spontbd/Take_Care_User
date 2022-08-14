// To parse this JSON data, do
//
//     final lovedOnesResponse = lovedOnesResponseFromJson(jsonString);

import 'dart:convert';

LovedOnesResponse lovedOnesResponseFromJson(String str) => LovedOnesResponse.fromJson(json.decode(str));


class LovedOnesResponse {
  LovedOnesResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<LovedOnes>? data;

  factory LovedOnesResponse.fromJson(Map<String, dynamic> json) => LovedOnesResponse(
    success: json["success"],
    message: json["message"],
    data: List<LovedOnes>.from(json["data"].map((x) => LovedOnes.fromJson(x))),
  );

}

class LovedOnes {
  LovedOnes({
    this.id,
    this.userId,
    this.name,
    this.age,
    this.contactNo,
    this.gender,
    this.relationship,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? name;
  int? age;
  String? contactNo;
  String? gender;
  String? relationship;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory LovedOnes.fromJson(Map<String, dynamic> json) => LovedOnes(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    age: json["age"],
    contactNo: json["contact_no"],
    gender: json["gender"],
    relationship: json["relationship"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
