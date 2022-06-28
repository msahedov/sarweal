import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/controllers/order.add.controller.dart';
import 'package:sarweal/controllers/order.controller.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:sarweal/views/bottom/bottom_nav_bar.dart';
import 'package:sarweal/views/order/neworder/calculator.dart';
import 'package:sarweal/views/profil/sub/privacy_and_policy_page.dart';
import 'package:sarweal/views/screen_repository.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    /// bottom navigation bar
    case BottomNavBar.routeName:
      return GetPageRoute(
        maintainState: true,
        fullscreenDialog: true,
        settings: RouteSettings(name: settings.name),
        page: () => const BottomNavBar(),
      );

    ///Orders Page
    case OrdersPage.routeName:
      return GetPageRoute(
        maintainState: false,
        fullscreenDialog: true,
        binding: BindingsBuilder.put(() => OrderController()),
        settings: RouteSettings(name: settings.name),
        page: () => const OrdersPage(),
      );

    ///Orders Page
    case Calculator.routeName:
      return GetPageRoute(
        maintainState: true,
        fullscreenDialog: true,
        routeName: Calculator.routeName,
        settings: RouteSettings(name: settings.name),
        page: () => Calculator(),
      );

    ///Add Order Page
    case NewOrderPage.routeName:
      return GetPageRoute(
        maintainState: true,
        transition: Transition.downToUp,
        fullscreenDialog: true,
        binding:
            BindingsBuilder.put(() => OrderAddController()), //lazyPut(() => OrderAddController()),
        settings: RouteSettings(name: settings.name),
        page: () => NewOrderPage(),
      );

    /// Order Tracking Page
    case OrderTrackingPage.routeName:
      return GetPageRoute<OrderModel>(
        fullscreenDialog: true,
        maintainState: true,
        transition: Transition.cupertino,
        settings: RouteSettings(name: settings.name),
        page: () => OrderTrackingPage(orderModel: settings.arguments as OrderModel),
      );

    /// Profil Pages
    case ProfilPage.routeName:
      return GetPageRoute(
        maintainState: false,
        fullscreenDialog: true,
        settings: RouteSettings(name: settings.name),
        page: () => const ProfilPage(),
      );

    /// Login Pages
    case LoginScreen.routeName:
      return GetPageRoute(
        transition: Transition.fadeIn,
        routeName: LoginScreen.routeName,
        fullscreenDialog: true,
        maintainState: true,
        settings: RouteSettings(name: settings.name),
        page: () => LoginScreen(),
      );

    ///OTP screen
    case OTPScreen.routeName:
      return GetPageRoute(
        maintainState: true,
        fullscreenDialog: true,
        transition: Transition.topLevel,
        settings: RouteSettings(name: settings.name),
        routeName: settings.name,
        page: () => OTPScreen(
          phone: settings.arguments as String,
        ),
      );

    ///About us page
    case AboutUsPage.routeName:
      return GetPageRoute(
        maintainState: true,
        fullscreenDialog: true,
        routeName: AboutUsPage.routeName,
        transition: Transition.fadeIn,
        settings: RouteSettings(name: settings.name),
        page: () => const AboutUsPage(),
      );

    ///Contacts
    case ContactsPage.routeName:
      return GetPageRoute(
        maintainState: true,
        routeName: QuestionPage.routeName,
        fullscreenDialog: true,
        transition: Transition.fadeIn,
        settings: RouteSettings(name: settings.name),
        page: () => const ContactsPage(),
      );

    ///Question Page
    case QuestionPage.routeName:
      return GetPageRoute(
        maintainState: true,
        routeName: QuestionPage.routeName,
        fullscreenDialog: true,
        transition: Transition.fadeIn,
        settings: RouteSettings(name: settings.name),
        page: () => const QuestionPage(),
      );
    case PrivacyAndPolicy.routeName:
      return GetPageRoute(
        maintainState: false,
        routeName: PrivacyAndPolicy.routeName,
        fullscreenDialog: true,
        transition: Transition.fade,
        settings: RouteSettings(name: settings.name),
        page: () => const PrivacyAndPolicy(),
      );

    ///Question Page
    case LanguageView.routeName:
      return GetPageRoute(
        maintainState: true,
        routeName: LanguageView.routeName,
        fullscreenDialog: true,
        transition: Transition.fadeIn,
        settings: RouteSettings(name: settings.name),
        page: () => const LanguageView(),
      );

    /// default
    default:
      return GetPageRoute(
          settings: RouteSettings(name: settings.name), page: () => const OrdersPage());
  }
}
