
import 'package:json_annotation/json_annotation.dart';
import 'package:takecare_user/model/order_items/service_order_item.dart';
import 'package:takecare_user/model/service/service_order.dart';

part 'app_data.g.dart';
@JsonSerializable()
class AppData {
  AppData({
    this.invoiceNumber,
    this.orderId,
    this.request_number,
    this.id,
    this.serviceOrderId,
    this.serviceId,
    this.servicePrice,
    this.serviceCount,
    this.serviceTotal,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.status,
    this.serviceName,
    this.serviceCategoryId,
    this.serviceType,
    this.price,
    this.description,
    this.serviceImage,
    this.serviceImageThumbnail,
    this.imagePath,
    this.serviceOrder,
    this.serviceOrderItems,
    this.coupon,
    this.coupon_type,
    this.discount
  });

  String? invoiceNumber;
  String? coupon;
  String? coupon_type;
  int? discount;
  int? orderId;
  String? request_number;
  List<ServiceOrderItem>? serviceOrderItems;
  int? id;
  int? serviceOrderId;
  int? serviceId;
  int? servicePrice;
  int? serviceCount;
  int? serviceTotal;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? status;
  String? serviceName;
  int? serviceCategoryId;
  String? serviceType;
  int? price;
  String? description;
  String? serviceImage;
  dynamic serviceImageThumbnail;
  dynamic imagePath;
  ServiceOrder? serviceOrder;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
