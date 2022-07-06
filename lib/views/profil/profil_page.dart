import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/service/auth.manager.dart';
import 'package:sarweal/views/bottom/bottom_nav_bar.dart';
import 'package:sarweal/views/screen_repository.dart';

class ProfilPage extends StatelessWidget {
  static const String routeName = '/profil';
  ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: Colors.white, //fonColor_2,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person_sharp,
                  size: 50,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey.shade100,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Myrat",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "+993 64664642",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            // ListTile(
            //   dense: true,
            //   contentPadding: EdgeInsets.symmetric(vertical: 10),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: circular10, side: BorderSide(color: Colors.grey.shade200)),
            //   tileColor: Colors.white,
            //   leading: CircleAvatar(
            //     radius: 30,
            //     child: Icon(
            //       Icons.person_sharp,
            //       size: 25,
            //       color: Colors.grey,
            //     ),
            //     backgroundColor: Colors.grey.shade100,
            //   ),
            //   subtitle: Text(
            //     "+993 64664642",
            //     style: Theme.of(context).textTheme.bodySmall,
            //   ),
            //   title: Text(
            //     "Myrat",
            //     style: Theme.of(context).textTheme.titleMedium,
            //   ),
            // ),

            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: circular25),
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Get.toNamed(LanguageView.routeName),
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.language_outlined,
                      size: 26,
                    ),
                    title: Text(
                      "change_locale".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  divider,
                  ListTile(
                    onTap: () => Get.toNamed(ContactsPage.routeName),
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.message_outlined,
                      size: 26,
                    ),
                    title: Text(
                      "contact_us".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  divider,
                  ListTile(
                    onTap: () => Get.toNamed(QuestionPage.routeName),
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.help_outline_outlined,
                      size: 26,
                    ),
                    title: Text(
                      "question_answer".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  divider,
                  ListTile(
                    onTap: () => Get.toNamed(AboutUsPage.routeName),
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.info_outline,
                      size: 26,
                    ),
                    title: Text(
                      "about_us".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  divider,
                  ListTile(
                    onTap: () {
                      Get.showOverlay(
                          asyncFunction: () {
                            AuthManager.logOut();
                            return Future.delayed(const Duration(milliseconds: 1000), () {
                              Get.offNamedUntil(BottomNavBar.routeName, (route) => false);
                            });
                          },
                          loadingWidget: const SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor_2,
                                ),
                              )));
                    },
                    tileColor: Colors.transparent,
                    leading: Icon(
                      Icons.logout,
                      size: 26,
                    ),
                    title: Text(
                      "log_out".tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  final Widget divider = Divider(
      height: 0, color: Colors.grey.shade300, thickness: 0.5, indent: 60.0, endIndent: 15.0);
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:get/get.dart';
// import 'package:sarweal/constants/enums.dart';
// import 'package:sarweal/service/auth.manager.dart';
// import 'package:sarweal/service/local.storage.dart';
// import 'package:sarweal/views/screen_repository.dart';

// class ProfilPage extends StatelessWidget {
//   static const String routeName = '/profil';
//    ProfilPage({Key? key}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
  
  
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//               padding: EdgeInsets.zero,
//               splashRadius: 25,
//               onPressed: () => Get.back(),
//               icon: const Icon(
//                 IconlyLight.arrowLeft2,
//                 color: Colors.black,
//               )),
//           systemOverlayStyle: const SystemUiOverlayStyle(
//               statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
//           elevation: 0.0,
//           backgroundColor: Colors.white, //fonColor_2,
//         ),
//         body: ListView(
//           physics: const NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           children: [
//             ListTile(
//       horizontalTitleGap: 0,
//       onTap: (){},
//       tileColor: Colors.grey.shade50,
//       leading: Icon(
//         Icons.call,
//         size: 26,
//       ),
//       title: Text(
//         LocalStorage?.getDataInDisk(StorageKey.phone.toString()) ?? " ",
//         style: Theme.of(context).textTheme.bodyMedium,
//       ),
//     ),
//             buttonProfile(
//               name: LocalStorage?.getDataInDisk(StorageKey.phone.toString()) ?? " ",
//               icon: Icons.call, //IconlyBold.call,
//               onTap: () {},
//             ),
//             divider,
//             buttonProfile(
//                 name: "login_btn".tr,
//                 icon: Icons.login_outlined, //IconlyLight.login,
//                 onTap: () {
//                   Get.toNamed(LoginScreen.routeName);
//                 }),
//             divider,
//             buttonProfile(
//               name: "change_locale".tr,
//               icon: Icons.language_outlined,
//               onTap: () => Get.toNamed(LanguageView.routeName),
//             ),
//             divider,
//             buttonProfile(
//               name: "contact_us".tr,
//               icon: Icons.message_outlined, //IconlyLight.chat,
//               onTap: () => Get.toNamed(ContactsPage.routeName),
//             ),
//             divider,
//             buttonProfile(
//               name: "question_answer".tr,
//               icon: Icons.help_outline_outlined,
//               onTap: () => Get.toNamed(QuestionPage.routeName),
//             ),
//             divider,
//             buttonProfile(
//               name: "about_us".tr,
//               icon: Icons.info_outline, //IconlyLight.infoSquare,
//               onTap: () => Get.toNamed(AboutUsPage.routeName),
//             ),
//             divider,
//             Obx(() => Get.find<AuthManager>().isLogged.value ? divider : const SizedBox.shrink()),
//             Obx(() => Get.find<AuthManager>().isLogged.value
//                 ? buttonProfile(name: "log_out".tr, icon: Icons.logout, onTap: _logout)
//                 : const SizedBox.shrink()),
//           ],
//         ));
//   }

//   final Widget divider =
//       Divider(height: 0, color: Colors.grey.shade50, thickness: 0.5, indent: 55.0, endIndent: 15.0);

//   Widget buttonProfile({required String name, required IconData icon, required Function() onTap}) {
//     return ListTile(
//       horizontalTitleGap: 0,
//       onTap: onTap,
//       tileColor: Colors.grey.shade50,
//       leading: Icon(
//         icon,
//         size: 26,
//       ),
//       title: Text(
//         name,
//         style: Theme.of(context).textTheme.bodyMedium,
//       ),
//     );
//   }

//   void _logout() async {
//     Get.find<AuthManager>().logOut();
//     Timer(const Duration(milliseconds: 200), () async {
//       // await FlutterRestart.restartApp();
//     }
    
//     );
//   }
// }
