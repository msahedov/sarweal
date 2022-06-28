import 'dart:convert';
import 'package:collection/collection.dart';
import 'item.model.dart';

class NewOrderModel {
  String? _customerAddress;
  String? _note;
  String? _phone;
  String? _name;
  String? _surName;
  List<NewOrderItemModel>? _orderItems;

  NewOrderModel({customerAddress, note, orderItems});

  String? get phone => _phone;

  set phone(String? phone) {
    _phone = phone;
  }

  String? get name => _name;

  set name(String? name) {
    _name = name;
  }

  String? get surName => _surName;

  set surName(String? surname) {
    _surName = surname;
  }

  String? get customerAddress => _customerAddress;

  set customerAddress(String? address) {
    _customerAddress = address;
  }

  String? get note => _note;

  set note(String? note) {
    _note = note;
  }

  List<NewOrderItemModel>? get orderItems => _orderItems;

  set orderItems(List<NewOrderItemModel>? items) {
    _orderItems = items;
  }

  @override
  String toString() {
    return 'NewOrderModel(customerAddress: $customerAddress, note: $note, orderItems: $orderItems)';
  }

  factory NewOrderModel.fromMap(Map<String, dynamic> data) => NewOrderModel(
        customerAddress: data['customerAddress'] as String?,
        note: data['note'] as String?,
        orderItems: (data['orderItems'] as List<dynamic>?)
            ?.map((item) => NewOrderItemModel.fromMap(item as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'customerAddress': customerAddress,
        'note': note,
        'orderItems': orderItems?.map((item) => item.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NewOrderModel].
  factory NewOrderModel.fromJson(String data) {
    return NewOrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NewOrderModel] to a JSON string.
  String toJson() => json.encode(toMap());

  NewOrderModel copyWith({
    String? customerAddress,
    String? note,
    List<NewOrderItemModel>? orderItems,
  }) {
    return NewOrderModel(
      customerAddress: customerAddress ?? _customerAddress,
      note: note ?? _note,
      orderItems: orderItems ?? _orderItems,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewOrderModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => customerAddress.hashCode ^ note.hashCode ^ orderItems.hashCode;
}
