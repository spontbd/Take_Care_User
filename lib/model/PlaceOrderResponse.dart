// To parse this JSON data, do
//
//     final placeOrderResponse = placeOrderResponseFromJson(jsonString);

import 'dart:convert';

PlaceOrderResponse placeOrderResponseFromJson(String str) => PlaceOrderResponse.fromJson(json.decode(str));


class PlaceOrderResponse {
  PlaceOrderResponse({
    this.seekerId,
    this.couponCode,
    this.orderNote,
    this.bookingDate,
    this.bookingAddress,
    this.latitude,
    this.longitude,
    this.services,
  });

  int? seekerId;
  String? couponCode;
  String? orderNote;
  DateTime? bookingDate;
  String? bookingAddress;
  String? latitude;
  String? longitude;
  List<Service>? services;

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) => PlaceOrderResponse(
    seekerId: json["seeker_id"],
    couponCode: json["coupon_code"],
    orderNote: json["order_note"],
    bookingDate: DateTime.parse(json["booking_date"]),
    bookingAddress: json["booking_address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

}

class Service {
  Service({
    this.providerId,
    this.serviceId,
    this.serviceQuantity,
  });

  int? providerId;
  int? serviceId;
  int? serviceQuantity;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    providerId: json["provider_id"],
    serviceId: json["service_id"],
    serviceQuantity: json["service_quantity"],
  );
}
