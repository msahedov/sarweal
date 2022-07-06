import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/neworder/new.order.model.dart';
import 'package:sarweal/models/ordertrack/order_item_model.dart';
import 'package:sarweal/service/api.service.dart';
import 'package:sarweal/service/auth.service.dart';
import 'package:sarweal/service/local.storage.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:uuid/uuid.dart';

class OrderService extends GetxService {
  static Future<List<OrderModel>?> getOrders() async {
    try {
      var response =
          await http.get(ApiService.orderListUrl, headers: ApiService.authorizationHeaders);

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body) as List;
        return parsed.map<OrderModel>((json) => OrderModel.fromMap(json)).toList();
      } else if (response.statusCode == 401 && response.body == "Unauthorized") {
        AuthService.refreshtoken();
        return getOrders();
      }
    } on SocketException {
      debugPrint("SocketException");
    }
    return null;
  }

  static Future<dynamic> getOrderItemsById(String orderId) async {
    try {
      var response = await http.get(ApiService.orderItemUrl(orderId),
          headers: ApiService.authorizationHeaders);

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body) as List;
        return parsed.map<OrderItemModel>((json) => OrderItemModel.fromMap(json)).toList();

        //return compute(OrderItemModel.parseOrderItems, response.body);
      } else if (response.statusCode == 401 || response.body == "Unauthorized") {
        AuthService.refreshtoken();
        return getOrderItemsById(orderId);
      }
    } on SocketException catch (_) {}
  }

  Future<void> uploadOrder(NewOrderModel newOrder) async {
    try {
      final String uuid = const Uuid().v4();

      ///request
      final request = http.MultipartRequest("POST", ApiService.orderUploadUrl(uuid));
      request.headers.addAll(ApiService.authorizationHeaders);
      request.fields["customerAddress"] = newOrder.customerAddress ?? "";
      request.fields["note"] = newOrder.note ?? "";

      ///
      for (var file in newOrder.orderItems ?? []) {
        final String fileName = file["image"].path.split("/").last;
        final stream = http.ByteStream(DelegatingStream(file["image"].openRead()).cast());
        final length = file["image"].length();
        final mimeType = lookupMimeType(file["image"].path, headerBytes: [0xFF, 0xD8])!.split('/');
        final fileContent = http.MultipartFile('picture', stream, length,
            filename: fileName, contentType: MediaType(mimeType[0], mimeType[1]));

        //   final fileBytes = file.readAsBytesSync();
        // final fileContent = http.MultipartFile.fromBytes(
        //   "file",
        //   fileBytes,
        //   filename: fileNameWithExtension,
        //   contentType: MediaType(mimeType),
        // );
        request.files.add(fileContent);
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
