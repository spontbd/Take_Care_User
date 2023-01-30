import 'package:json_annotation/json_annotation.dart';

part 'service_order.g.dart';

@JsonSerializable()
class ServiceOrder {
  ServiceOrder({
    this.id,
    this.invoiceNumber,
    this.seekerId,
    this.providerId,
    this.couponId,
    this.couponDiscount,
    this.tax,
    this.subtotalPrice,
    this.orderNote,
    this.paymentMethod,
    this.paymentStatus,
    this.bookingDate,
    this.bookingAddress,
    this.latitude,
    this.longitude,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? invoiceNumber;
  int? seekerId;
  int? providerId;
  int? couponId;
  int? couponDiscount;
  double? tax;
  double? subtotalPrice;
  String? orderNote;
  String? paymentMethod;
  String? paymentStatus;
  DateTime? bookingDate;
  String? bookingAddress;
  String? latitude;
  String? longitude;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ServiceOrder.fromJson(Map<String, dynamic> json) => _$ServiceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderToJson(this);
}
