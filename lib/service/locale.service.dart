import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/service/local.storage.dart';

class LocaleController {
  static LocalStorage? _storage;

  ///Changed function
  set changeApplocale(String l) {
    Get.updateLocale(Locale(l));
    _storage?.saveDataToDisk(key: StorageKey.locale.toString(), value: l);
    //update();
  }

  Locale get getlocale {
    String code = _storage?.getDataInDisk(StorageKey.locale.toString()) ?? "tk";
    return Locale(code);
  }

  String get getlocaleForApi {
    String languageCode = _storage?.getDataInDisk(StorageKey.locale.toString()) ?? "tk";
    if (languageCode == "tk") {
      return "tkm";
    } else {
      return languageCode;
    }
  }
}
