import 'package:get_storage/get_storage.dart';

mixin LocalStorage {
  final GetStorage _localDisk = GetStorage();

  ///
  ///save data to disk
  ///
  Future<void> saveDataToDisk({required String? key, required dynamic value}) async {
    if (_localDisk.hasData(key ?? "key")) {
      await _localDisk.remove(key ?? "key");
    }
    await _localDisk.write(key ?? "key", value);
  }

  ///
  ///read data
  ///
  dynamic getDataInDisk(String key) {
    return _localDisk.read(key);
  }

  ///
  ///remove data
  ///
  Future<void> deleteDataInDisk(String key) async {
    await _localDisk.remove(key);
  }

  ///
  ///clear storage
  ///
  void clearBox() {
    _localDisk.erase();
  }
}
