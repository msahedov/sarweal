import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/api_response.dart';
import 'package:sarweal/models/user.model.dart';
import 'package:sarweal/service/api.service.dart';
import 'package:sarweal/service/auth.manager.dart';
import 'package:sarweal/service/local.storage.dart';

class AuthService {
  static LocalStorage? _storage;
  static final AuthManager _manager = Get.find();

  ///
  ///
  ///
  static Future<ApiResponse?> login(String phone) async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      var response = await http.post(
        ApiService.loginUrl,
        headers: ApiService.headers,
        body: jsonEncode(<String, String>{"phone": phone, "token": fcmToken ?? "Token $phone"}),
      );
      if (response.statusCode == 200) {
        return ApiResponse(
            success: true, data: response.body, message: ResponseMessage.sended, code: 200);
      } else if (response.statusCode == 422) {
        return ApiResponse(
            success: false, data: response.body, message: ResponseMessage.phoneError, code: 422);
      }
    } on SocketException {
      return ApiResponse(success: false, message: ResponseMessage.connectionError, code: 500);
    }
    return null;
  }

  static Future<ApiResponse?> verifyOtpCode(String phone, String code) async {
    try {
      var response = await http.post(ApiService.verifyCodeUrl,
          headers: ApiService.headers,
          body: jsonEncode(<String, String>{"phone": phone, "code": code}));
      if (response.statusCode == 200) {
        ///Tokens
        final accesstoken = json.decode(response.body)["access_token"];
        final refreshtoken = json.decode(response.body)["refresh_token"];
        final verifytoken = json.decode(response.body)["verified_token"];

        ///user data
        final user = User.fromMap(json.decode(response.body)["data"]);

        ///save data's in local storage
        _manager.login("+993 $phone", accesstoken, refreshtoken, user, verifytoken);

        return ApiResponse(success: true, code: 200);
      } else if (response.statusCode == 404) {
        return ApiResponse(success: false, code: 404);
      }
    } on SocketException {
      return ApiResponse(success: false, code: 500);
    }
    return null;
  }

  static void refreshtoken() async {
    try {
      final refreshtoken = _storage?.getDataInDisk(StorageKey.refreshtoken.toString());
      var response = await http.get(ApiService.refreshtokenUrl,
          headers: ApiService.authorizationHeader(refreshtoken));
      if (response.statusCode == 200) {
        final accesstoken = json.decode(response.body)['token'];
        _storage?.saveDataToDisk(key: StorageKey.accesstoken.toString(), value: accesstoken);
      }
      // ignore: empty_catches
    } on SocketException {}
  }
}
