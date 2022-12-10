
import 'package:json_annotation/json_annotation.dart';

part 'app_data.g.dart';
@JsonSerializable()
class AppData {
  AppData({
    this.invoiceNumber,
    this.orderId,
    this.request_number
  });

  String? invoiceNumber;
  int? orderId;
  String? request_number;

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
