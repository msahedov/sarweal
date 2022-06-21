import 'package:get/get.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/user.model.dart';
import 'package:sarweal/service/user.service.dart';
import 'local.storage.dart';

class AuthManager extends GetxController {
  static LocalStorage? _storage;
  final isLogged = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> logOut() async {
    isLogged.value = false;
    _storage?.clearBox();
  }

  void login(String phone, String accesstoken, String refreshtoken, User user, String verifytoken) {
    isLogged.value = true;
    _storage?.saveDataToDisk(key: StorageKey.phone.toString(), value: phone);
    _storage?.saveDataToDisk(key: StorageKey.refreshtoken.toString(), value: refreshtoken);
    _storage?.saveDataToDisk(key: StorageKey.accesstoken.toString(), value: accesstoken);
    _storage?.saveDataToDisk(key: StorageKey.verifytoken.toString(), value: verifytoken);
    UserService.save(user);
    // update();
  }

  void checkLoginStatus() {
    final token = _storage?.getDataInDisk(StorageKey.accesstoken.toString());
    if (token != null) {
      isLogged.value = true;
      // update();
    }
  }
}
