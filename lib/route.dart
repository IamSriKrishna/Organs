import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mohan/Feature/Screen/Auth/Login.dart';
import 'package:mohan/Feature/Screen/ModelScreen/ModelScreen.dart';
import 'package:mohan/Feature/Screen/Overscreen/Notification/Notifications.dart';
import 'package:mohan/Widget/Drawer/CustomHiddenDrawer.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> onGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Notifications.route:
      return PageTransition(
        duration: const Duration(milliseconds: 100),
        child: const Notifications(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    case ModelScreen.route:
      return PageTransition(
        duration: const Duration(milliseconds: 100),
        child: ModelScreen(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    case LoginScreen.route:
      return PageTransition(
        duration: const Duration(milliseconds: 100),
        child: LoginScreen(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    case HiddenDrawer.route:
      return PageTransition(
        duration: const Duration(milliseconds: 100),
        child: HiddenDrawer(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    default:
      return PageTransition(
        duration: const Duration(milliseconds: 350),
        child: Scaffold(
          body: Center(
            child: Lottie.asset('asset/lottie/404.json'),
          ),
        ),
        type: PageTransitionType.fade,
        settings: settings,
      );
  }
}
