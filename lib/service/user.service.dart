import 'package:sarweal/models/user.model.dart';
import 'package:sarweal/service/local.storage.dart';

class UserService {
  static User get getData => LocalStorage?.getDataInDisk("user");

  static void save(User? user) {
    LocalStorage?.saveDataToDisk(key: "user", value: user);
  }

  static void remove() {
    LocalStorage?.deleteDataInDisk("user");
  }
}
