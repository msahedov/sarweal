import 'package:get_storage/get_storage.dart';

mixin LocalStorage {
  static final GetStorage _localDisk = GetStorage();

  ///
  ///save data to disk
  ///
  static Future<void> saveDataToDisk({required String key, dynamic value}) async {
    if (_localDisk.hasData(key)) {
      await _localDisk.remove(key);
    }
    await _localDisk.write(key, value);
  }

  ///
  ///read data
  ///
  static dynamic getDataInDisk(String key) {
    return _localDisk.read(key);
  }

  ///
  ///remove data
  ///
  static Future<void> deleteDataInDisk(String key) async {
    await _localDisk.remove(key);
  }

  ///
  ///clear storage
  ///
  static void clearBox() {
    _localDisk.erase();
  }
}
