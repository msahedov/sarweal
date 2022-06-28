import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_app_restart/flutter_app_restart.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/service/auth.manager.dart';
import 'package:sarweal/service/local.storage.dart';
import 'package:sarweal/views/screen_repository.dart';

class ProfilPage extends StatefulWidget {
  static const String routeName = '/profil';
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> with LocalStorage {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 25,
              onPressed: () => Get.back(),
              icon: const Icon(
                IconlyLight.arrowLeft2,
                color: Colors.black,
              )),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: Colors.white, //fonColor_2,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            Obx(() => Get.find<AuthManager>().isLogged.value
                ? Row(
                    children: [
                      Container(
                        height: 30,
                        width: 5,
                        decoration: BoxDecoration(
                          borderRadius: circular5,
                          color: primaryColor_2,
                        ),
                      ),
                      // myText("phone".tr),
                    ],
                  )
                : const SizedBox.shrink()),
            Obx(() => Get.find<AuthManager>().isLogged.value
                ? buttonProfile(
                    name: getDataInDisk(StorageKey.phone.toString()) ?? " ",
                    icon: Icons.call, //IconlyBold.call,
                    onTap: () {},
                  )
                : buttonProfile(
                    name: "login_btn".tr,
                    icon: Icons.login_outlined, //IconlyLight.login,
                    onTap: () {
                      Get.toNamed(LoginScreen.routeName);
                    })),
            divider,
            buttonProfile(
              name: "change_locale".tr,
              icon: Icons.language_outlined,
              onTap: () => Get.toNamed(LanguageView.routeName),
            ),
            divider,
            buttonProfile(
              name: "contact_us".tr,
              icon: Icons.message_outlined, //IconlyLight.chat,
              onTap: () => Get.toNamed(ContactsPage.routeName),
            ),
            divider,
            buttonProfile(
              name: "question_answer".tr,
              icon: Icons.help_outline_outlined,
              onTap: () => Get.toNamed(QuestionPage.routeName),
            ),
            divider,
            buttonProfile(
              name: "about_us".tr,
              icon: Icons.info_outline, //IconlyLight.infoSquare,
              onTap: () => Get.toNamed(AboutUsPage.routeName),
            ),
            divider,
            Obx(() => Get.find<AuthManager>().isLogged.value ? divider : const SizedBox.shrink()),
            Obx(() => Get.find<AuthManager>().isLogged.value
                ? buttonProfile(name: "log_out".tr, icon: Icons.logout, onTap: _logout)
                : const SizedBox.shrink()),
          ],
        ));
  }

  final Widget divider =
      Divider(height: 0, color: Colors.grey.shade50, thickness: 0.5, indent: 55.0, endIndent: 15.0);

  Widget buttonProfile({required String name, required IconData icon, required Function() onTap}) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: onTap,
      tileColor: Colors.grey.shade50,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  void _logout() async {
    Get.find<AuthManager>().logOut();
    Timer(const Duration(milliseconds: 200), () async {
      // await FlutterRestart.restartApp();
    });
  }
}
