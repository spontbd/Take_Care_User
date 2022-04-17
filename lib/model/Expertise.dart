import 'dart:convert';

ExpertiseResponse expertiseResponseFromJson(String str) => ExpertiseResponse.fromJson(json.decode(str));

class ExpertiseResponse {
  ExpertiseResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<ExpertiseResponseData> data;

  factory ExpertiseResponse.fromJson(Map<String, dynamic> json) => ExpertiseResponse(
    success: json["success"],
    message: json["message"],
    data: List<ExpertiseResponseData>.from(json["data"].map((x) => ExpertiseResponseData.fromJson(x))),
  );

}

class ExpertiseResponseData {
  ExpertiseResponseData({
    this.id,
    required this.expertiseName,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    required this.specialities,
  });

  int? id;
  dynamic expertiseName;
  dynamic description;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  List<Speciality> specialities;

  factory ExpertiseResponseData.fromJson(Map<String, dynamic> json) => ExpertiseResponseData(
    id: json["id"],
    expertiseName: json["expertise_name"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    specialities: List<Speciality>.from(json["specialities"].map((x) => Speciality.fromJson(x))),
  );
}

class Speciality {
  Speciality({
    this.id,
    required this.specialityName,
    this.expertiseId,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic specialityName;
  int? expertiseId;
  dynamic description;
  int? status;
  String? createdAt;
  String? updatedAt;

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
    id: json["id"],
    specialityName: json["speciality_name"],
    expertiseId: json["expertise_id"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

}
