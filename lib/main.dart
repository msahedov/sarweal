import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/service/routes.dart';
import 'service/locale.service.dart';
import 'l10n/translations.dart';
import 'service/auth.manager.dart';
import 'views/bottom/bottom_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAY3ReYHYWRefD7gQ77wNcVihLJ2xPKVJ8',
      appId: '1:307541214501:android:04fa539d31d568282e86cc',
      messagingSenderId: '307541214501',
      projectId: 'sarweal-270e4',
    ),
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.requestPermission();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  await GetStorage.init();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  //initAllControllers();
  AppBindings().dependencies();
  runApp(const SarweAl());
}

class SarweAl extends StatelessWidget {
  const SarweAl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: LocaleController().getlocale,
      title: 'Sarweal',
      navigatorKey: Get.key,
      translations: LocaleString(),
      theme: ThemeData(
        fontFamily: "Rubik",
        accentColor: primaryColor_2,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: BottomNavBar.routeName,
    );
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'sarweal_order_status', // id
    'Sarweal Status Notifications', // title
    description: 'This channel is used for order status notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAY3ReYHYWRefD7gQ77wNcVihLJ2xPKVJ8',
      appId: '1:307541214501:android:04fa539d31d568282e86cc',
      messagingSenderId: '307541214501',
      projectId: 'sarweal-270e4',
    ),
  );
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //  Get.put<LocaleController>(LocaleController());
    Get.put<AuthManager>(AuthManager());
    //Get.put<OrderController>(OrderController());
    //Get.put<OrderAddController>(OrderAddController());
  }
}
