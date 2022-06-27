// To parse this JSON data, do
//
//     final saveAddressResponse = saveAddressResponseFromJson(jsonString);

import 'dart:convert';

SaveAddressResponse saveAddressResponseFromJson(String str) => SaveAddressResponse.fromJson(json.decode(str));

class SaveAddressResponse {
  SaveAddressResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory SaveAddressResponse.fromJson(Map<String, dynamic> json) => SaveAddressResponse(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.beneficiaryName,
    this.district,
    this.city,
    this.postcode,
    this.lon,
    this.lat,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? beneficiaryName;
  String? district;
  String? city;
  String? postcode;
  String? lon;
  String? lat;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    beneficiaryName: json["beneficiary_name"],
    district: json["district"],
    city: json["city"],
    postcode: json["postcode"],
    lon: json["lon"],
    lat: json["lat"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

}
