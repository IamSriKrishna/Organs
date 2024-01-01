import 'package:flutter/material.dart';
import 'package:mohan/Feature/Screen/Overscreen/Notification/Notifications.dart';
import 'package:mohan/Feature/Screen/Overscreen/OverScreen.dart';
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
    case OverScreen.route:
      return PageTransition(
        duration: const Duration(milliseconds: 100),
        child: OverScreen(),
        type: PageTransitionType.fade,
        settings: settings,
      );
    default:
      return PageTransition(
        duration: const Duration(milliseconds: 350),
        child: Scaffold(
          body: Center(
            child: Text("Page Not Found"),
          ),
        ),
        type: PageTransitionType.fade,
        settings: settings,
      );
  }
}
