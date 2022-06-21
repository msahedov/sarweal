import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';

class Snackbar {
  final SnackBarType? type;
  final String? text;
  final IconData? icon;

  Snackbar(this.type, this.text, this.icon);

  static void showSnackbar(SnackBarType type) {
    switch (type) {
      case SnackBarType.connection:
        {
          Get.closeCurrentSnackbar();
          Get.showSnackbar(GetSnackBar(
            backgroundColor: primaryColor_1,
            margin: paddingHV1015,
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 10,
            icon: const Icon(
              Icons.wifi_off,
              color: Colors.blue,
              size: 30,
            ),
            snackStyle: SnackStyle.FLOATING,
            message: "no_connection".tr,
          ));
          break;
        }
      case SnackBarType.phoneError:
        Get.closeCurrentSnackbar();
        Get.showSnackbar(GetSnackBar(
          backgroundColor: primaryColor_1,
          margin: paddingHV1015,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 12,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 30,
          ),
          message: "correct_val_txt".tr,
        ));
        break;
    }
  }
}
