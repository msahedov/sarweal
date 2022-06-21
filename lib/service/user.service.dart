import 'package:sarweal/models/user.model.dart';
import 'package:sarweal/service/local.storage.dart';

class UserService {
  static LocalStorage? _storage;

  static User get getData => _storage?.getDataInDisk("user");

  static void save(User? user) {
    _storage?.saveDataToDisk(key: "user", value: user);
  }

  static void remove() {
    _storage?.deleteDataInDisk("user");
  }
}
