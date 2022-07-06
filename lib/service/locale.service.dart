import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/service/local.storage.dart';

class LocaleController {
  ///Changed function
  set changeApplocale(String l) {
    Get.updateLocale(Locale(l));
    LocalStorage?.saveDataToDisk(key: StorageKey.locale.toString(), value: l);
    //update();
  }

  Locale get getlocale {
    String code = LocalStorage?.getDataInDisk(StorageKey.locale.toString()) ?? "tk";
    return Locale(code);
  }

  String get getlocaleForApi {
    String languageCode = LocalStorage?.getDataInDisk(StorageKey.locale.toString()) ?? "tk";
    if (languageCode == "tk") {
      return "tkm";
    } else {
      return languageCode;
    }
  }
}
