import 'dart:convert';
import 'item_step.dart';

class OrderItemModel {
  int? id;
  String? createdTime;
  String? orderId;
  String? quantity;
  String? size;
  String? color;
  String? price;
  String? photo;
  String? status;
  String? step;
  String? totalPrice;
  int? stepId;
  List<OrderItemStep>? steps;

  OrderItemModel({
    this.id,
    this.createdTime,
    this.orderId,
    this.quantity,
    this.size,
    this.color,
    this.price,
    this.step,
    this.status,
    this.totalPrice,
    this.stepId,
    this.photo,
    this.steps,
  });

  factory OrderItemModel.fromMap(final data) {
    return OrderItemModel(
      totalPrice: data["total_price"],
      status: data["status"],
      step: data["step"],
      id: data['id'],
      createdTime: data['created_time'],
      orderId: data['order_id'],
      quantity: data['quantity'],
      size: data['size'],
      color: data['color'],
      price: data['price'],
      stepId: data['step_id'],
      photo: 'http://admin.sarweal.com/' + data['photo'],
      steps: (data['steps'] as List<dynamic>?)
          ?.map((e) => OrderItemStep.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OrderItemModel.fromJson(String data) {
    return OrderItemModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  static List<OrderItemModel> parseOrderItems(String responseBody) {
    final parsed = json.decode(responseBody) as List;
    return parsed.map<OrderItemModel>((json) => OrderItemModel.fromMap(json)).toList();
  }
}
