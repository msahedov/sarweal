// import 'package:get/state_manager.dart';
// import 'package:sarweal/constants/enums.dart';
// import 'package:sarweal/service/auth.service.dart';

// class AuthController extends GetxController with StateMixin<ResponseMessage> {
//   void login(String phone, String token) async {
//     change(null, status: RxStatus.loading());
//     var res = await AuthService.login(
//       phone,
//     );

//     if (res.message == ResponseMessage.sended) {
//       change(ResponseMessage.sended, status: RxStatus.success());
//     } else if (res.message == ResponseMessage.phoneError) {
//       change(ResponseMessage.phoneError, status: RxStatus.success());
//     } else if (res.message == ResponseMessage.connection) {
//       change(ResponseMessage.connection, status: RxStatus.success());
//     }
//   }

//   void verifyCode(String phone, String code) {
//     final res = AuthService.verifyOtpCode(phone, code);

//     ///

//     ///
//   }

//   Future<dynamic> authenicationWithOtpCode(String phone, String password) async {
//     final response = AuthService.verifyOtpCode(phone, password);
//     return response;
//   }

//   Future<dynamic> postphone(String phone, String fcmtoken) async {
//     final result = await AuthService.login(phone);
//     return result;
//   }
// }
