import 'package:json_annotation/json_annotation.dart';

part 'save_address.g.dart';

@JsonSerializable()
class SaveAddress {
  SaveAddress({
    this.id,
    this.user_id,
    this.beneficiary_name,
    this.district,
    this.city,
    this.postcode,
    this.lon,
    this.lat,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? user_id;
  String? beneficiary_name;
  String? district;
  String? city;
  String? postcode;
  String? lon;
  String? lat;
  dynamic created_at;
  dynamic updated_at;

  factory SaveAddress.fromJson(Map<String, dynamic> json) => _$SaveAddressFromJson(json);

  Map<String, dynamic> toJson() => _$SaveAddressToJson(this);


}