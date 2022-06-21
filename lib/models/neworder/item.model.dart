import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:image_picker/image_picker.dart';

class NewOrderItemModel {
  NewOrderItemModel({quantity, size, color, image, link});

  int? _quantity;

  ///
  /// Product count 1,2,3...
  ///
  ///
  String? _size;

  ///
  /// Meeting of the item
  /// Eg [XL,L,3XL]..
  ///
  ///
  String? _color;

  ///
  /// The color of the item
  /// [Gara , Ak , Mawy] as string
  ///
  ///
  String? _link;

  ///
  /// The reference in the Trendyol of the item
  /// Exapmle [https://bit.ly/2XzZ9Zx] ...
  ///
  ///
  XFile? _image;

  ///
  /// Screenshot of the item
  /// Picture found in Trendyol Application

  /// Getters and Setters
  ///
  ///
  String? get color => _color;

  set color(String? color) {
    _color = color;
  }

  int get quantity => _quantity ?? 1;

  set quantity(int? quantity) {
    _quantity = quantity;
  }

  String? get size => _size;

  set size(String? size) {
    _size = size;
  }

  XFile? get image => _image;

  set image(XFile? image) {
    _image = image;
  }

  String? get link => _link;

  set link(String? link) {
    _link = link;
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory NewOrderItemModel.fromJson(String data) {
    return NewOrderItemModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory NewOrderItemModel.fromMap(Map<String, dynamic> data) => NewOrderItemModel(
        quantity: data['quantity'] as int?,
        size: data['size'] as String?,
        image: data['image'] as String?,
        color: data['color'] as String,
        link: data['link'] as String?,
      );

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
        'quantity': quantity,
        'size': size,
        'image': image,
        'color': color,
        'link': link,
      };
  @override
  String toString() {
    return 'Item(quantity: $quantity, size: $size,color: $color, image: $image, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewOrderItemModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => quantity.hashCode ^ color.hashCode ^ size.hashCode ^ image.hashCode ^ link.hashCode;
}
