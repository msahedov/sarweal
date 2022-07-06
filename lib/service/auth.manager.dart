import 'package:get/get.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/user.model.dart';
import 'package:sarweal/service/user.service.dart';
import 'local.storage.dart';

class AuthManager extends GetxController {
  static final isLogged = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  static Future<void> logOut() async {
    isLogged.value = false;
    LocalStorage?.clearBox();
  }

  void login(String phone, String accesstoken, String refreshtoken, User user, String verifytoken) {
    isLogged.value = true;

    LocalStorage?.saveDataToDisk(key: StorageKey.phone.toString(), value: phone);
    LocalStorage?.saveDataToDisk(key: StorageKey.refreshtoken.toString(), value: refreshtoken);
    LocalStorage?.saveDataToDisk(key: StorageKey.accesstoken.toString(), value: accesstoken);
    LocalStorage?.saveDataToDisk(key: StorageKey.verifytoken.toString(), value: verifytoken);
    UserService.save(user);
    // update();
  }

  void checkLoginStatus() {
    final token = LocalStorage?.getDataInDisk(StorageKey.accesstoken.toString());
    if (token != null) {
      isLogged.value = true;
      // update();
    }
  }
}
