import 'package:flutter/material.dart';
import 'package:sarweal/service/auth.manager.dart';
import 'package:sarweal/views/login/login_page.dart';

guardedRouteBuilder(Widget directTo) {
  if (AuthManager.isLogged.value) {
    return directTo;
  } else {
    return LoginScreen();
  }
}
