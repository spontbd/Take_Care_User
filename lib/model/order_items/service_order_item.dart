import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/order_items/provider_data.dart';
import 'package:takecare_user/model/order_items/service_order_item_list.dart';
part 'service_order_item.g.dart';

@JsonSerializable()
class ServiceOrderItem{
  ServiceOrderItem({
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
    this.coupon,
    this.seeker,
    this.provider,
    this.serviceOrderItemList,
  });

  int? id;
  String? invoiceNumber;
  int? seekerId;
  int? providerId;
  dynamic couponId;
  int? couponDiscount;
  int? tax;
  int? subtotalPrice;
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
  List<dynamic>? coupon;
  ProviderData? seeker;
  ProviderData? provider;
  List<ServiceOrderItemList>? serviceOrderItemList;

  factory ServiceOrderItem.fromJson(Map<String, dynamic> json) => _$ServiceOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderItemToJson(this);

}
