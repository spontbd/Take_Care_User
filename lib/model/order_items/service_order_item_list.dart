import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/order_items/service_details.dart';
part 'service_order_item_list.g.dart';

@JsonSerializable()
class ServiceOrderItemList {
  ServiceOrderItemList({
    this.id,
    this.serviceOrderId,
    this.serviceId,
    this.servicePrice,
    this.serviceCount,
    this.serviceTotal,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  int? id;
  int? serviceOrderId;
  int? serviceId;
  int? servicePrice;
  int? serviceCount;
  int? serviceTotal;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceDetails? service;

  factory ServiceOrderItemList.fromJson(Map<String, dynamic> json) => _$ServiceOrderItemListFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceOrderItemListToJson(this);


}