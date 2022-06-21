import 'dart:convert';

class OrderModel {
  String? id;
  String? order;
  int? orderId;
  int? userId;
  String? createdTime;
  String? customerAddress;
  int? processId;
  String? process;
  String? totalPrice;
  String? count;
  String? note;

  OrderModel({this.id, this.order, this.orderId, this.userId, this.createdTime, this.process, this.totalPrice, this.count, this.customerAddress, this.note, this.processId});

  factory OrderModel.fromMap(final data) => OrderModel(
      id: data['id'],
      orderId: data["order_id"],
      userId: data["user_id"],
      customerAddress: data["customer_address"],
      note: data["note"],
      processId: data["process_id"],
      order: data['order'],
      createdTime: data['created_time'],
      process: data['process'],
      totalPrice: data['total_price'],
      count: data['count']);

  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, String>);
  }
}
