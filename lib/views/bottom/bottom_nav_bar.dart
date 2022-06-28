import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/views/screen_repository.dart';

ValueNotifier<int> pageIndex = ValueNotifier(0);

class BottomNavBar extends StatefulWidget {
  static const String routeName = '/';
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  
  TabController? tabController;
  final newVersion = NewVersion(
    iOSId: 'com.bilermennesil.sarweal',
    androidId: 'com.bilermennesil.sarweal',
  );
  appVersionCheck(NewVersion newVersion) async {
    try {
      final status = await newVersion.getVersionStatus();

      if (status != null) {
        if (status.canUpdate) {
          newVersion.showUpdateDialog(
              context: context,
              versionStatus: status,
              dismissButtonText: "no".tr,
              dialogTitle: "newVersion".tr,
              dialogText: "newVersionTitle".tr,
              dismissAction: () {
                Navigator.of(context).pop();
              },
              updateButtonText: "yes".tr);
        }
      }
    } on SocketException catch (err) {
      debugPrint(err.toString());
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    if (mounted) {
      //  appVersionCheck(newVersion);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int index, Widget? child) {
          return Scaffold(
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  OrdersPage(),
                  NewOrderPage(subPageController: tabController),
                  ProfilPage()
                ]),

            // body: PageView(
            //   onPageChanged: (val) {
            //     pageIndex.value = val;
            //   },
            //   controller: _pageController,
            //   scrollDirection: Axis.horizontal,
            //   physics: const PageScrollPhysics(),
            //   children: [
            //     OrdersPage(),
            //     NewOrderPage(subPageController: _pageController),
            //     ProfilPage()
            //   ],
            // ),
            bottomNavigationBar: AnimatedCrossFade(
              crossFadeState: index == 1 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              secondChild: const SizedBox.shrink(),
              firstChild: BottomNavigationBar(
                  onTap: (val) {
                    ///
                    pageIndex.value = val;
                    tabController?.animateTo(val);
                    // _pageController.animateToPage(val,
                    //     duration: const Duration(milliseconds: 500), curve: Curves.linear);

                    ///
                  },
                  backgroundColor: Colors.white,
                  enableFeedback: true,
                  elevation: 10.0,
                  currentIndex: index,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedLabelStyle: Theme.of(context).textTheme.caption,
                  unselectedLabelStyle: Theme.of(context).textTheme.caption,
                  selectedFontSize: 12,
                  iconSize: 26,
                  selectedItemColor: Colors.grey,
                  unselectedItemColor: Colors.grey,
                  unselectedFontSize: 12,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.home, color: Colors.grey),
                        activeIcon: Icon(
                          IconlyLight.home,
                          color: Colors.black,
                        ),
                        label: "Sargytlarym"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          IconlyBold.plus,
                          color: primaryColor_2,
                          size: 30,
                        ),
                        // activeIcon: Icon(
                        //   IconlyBold.plus,
                        //   color: primaryColor_2,
                        // ),
                        label: "Sarga"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.profile, color: Colors.grey),
                        activeIcon: Icon(
                          IconlyLight.profile,
                          color: Colors.black,
                        ),
                        label: "Profil")
                  ]),
              duration: const Duration(milliseconds: 500),
            ),
          );
        });
  }
}
