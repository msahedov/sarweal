import 'dart:convert';
import 'package:sarweal/models/ordertrack/status.dart';

class OrderItemStep {
  String? code;
  List<Status>? status;

  OrderItemStep({this.code, this.status});

  factory OrderItemStep.fromMap(Map<String, dynamic> data) => OrderItemStep(
        code: data['code'] as String?,
        status: (data['status'] as List<dynamic>?)?.map((e) => Status.fromMap(e as Map<String, dynamic>)).toList(),
      );

  factory OrderItemStep.fromJson(String data) {
    return OrderItemStep.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
