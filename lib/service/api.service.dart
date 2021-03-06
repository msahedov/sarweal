import 'dart:io';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/service/local.storage.dart';
import 'package:sarweal/service/locale.service.dart';

class ApiService {
  ////Server url
  static String get serverUrl => "admin.sarweal.com";

  ////Headers
  static Map<String, String> get headers =>
      <String, String>{HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8"};
  static Map<String, String> get authorizationHeaders => <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            'Bearer ${LocalStorage?.getDataInDisk(StorageKey.accesstoken.toString())}'
      };
  static Map<String, String> get authorizationHeaderResfresh => <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader:
            'Bearer ${LocalStorage?.getDataInDisk(StorageKey.refreshtoken.toString())}'
      };
  ////All url's in app
  static final Uri loginUrl = Uri.http(serverUrl, '/api/auth/login');
  static final Uri verifyCodeUrl = Uri.http(serverUrl, '/api/auth/verify-code');
  static final Uri orderListUrl =
      Uri.http(serverUrl, "/api/orders/${LocaleController().getlocaleForApi}/customer/order-list");
  static final Uri refreshtokenUrl = Uri.http(serverUrl, "/api/auth/token-refresh");
  static Uri orderItemUrl(String itemId) => Uri.http(
      serverUrl, '/api/orders/${LocaleController().getlocaleForApi}/customer/order-item/$itemId');
  static Uri orderUploadUrl(String uuidV4) =>
      Uri.http(serverUrl, "/api/orders/customer/orders/$uuidV4");
}
