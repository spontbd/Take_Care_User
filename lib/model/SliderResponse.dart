import 'dart:convert';

SliderResponse sliderResponseFromJson(String str) => SliderResponse.fromJson(json.decode(str));

class SliderResponse {
  SliderResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}

class Datum {
  Datum({
    this.id,
    this.sliderTitle,
    this.sliderDescription,
    this.sliderImage,
    this.sliderLink,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? sliderTitle;
  String? sliderDescription;
  String? sliderImage;
  String? sliderLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sliderTitle: json["slider_title"],
    sliderDescription: json["slider_description"],
    sliderImage: json["slider_image"],
    sliderLink: json["slider_link"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
