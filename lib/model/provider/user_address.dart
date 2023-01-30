import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

@JsonSerializable()
class UserAddress {
  UserAddress({
    this.id,
    this.userId,
    this.district,
    this.city,
    this.postcode,
    this.lon,
    this.lat,
    this.created_at,
    this.updated_at,
  });

  int? id;
  int? userId;
  String? district;
  String? city;
  String? postcode;
  String? lon;
  String? lat;
  dynamic created_at;
  dynamic updated_at;

  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);


}
