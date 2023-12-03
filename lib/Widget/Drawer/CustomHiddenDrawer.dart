import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mohan/Feature/Screen/Overscreen/More/MoreOption.dart';
import 'package:mohan/Feature/Screen/Overscreen/OverScreen.dart';
import 'package:mohan/Util/localNotification.dart';
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';
class HiddenDrawer extends StatefulWidget {
  static const route = 'HiddenDrawer';
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;


  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {

    subscription.cancel();
    super.dispose();
  }

  List<ScreenHiddenDrawer> _pages = [];

  Future<void> _website(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url,);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw 'can not launch';
    }
  }
  @override
  void initState() {
    LocalNotifications.showSimpleNotification(
      title: "MOHAN Foundation",
      body: "Welcome Back:)",
      );
    getConnectivity();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: themeColor.lightblue,
          name: 'MOHAN Foundation', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        const OverScreen()
      ),
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     colorLineSelected: Colors.red,
      //     name: 'BookMark', 
      //     baseStyle: const TextStyle(), 
      //     selectedStyle: const TextStyle(),
      //   ), 
      //   BookmarkPage()
      // ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: themeColor.green,
          name: 'More Option', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        const MoreOption()
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      initPositionSelected: 0,
      backgroundColorMenu: Colors.transparent,
      backgroundColorAppBar: Colors.white,
      screens: _pages,
      leadingAppBar: Transform.flip(
          flipX: true,
          child: Image.asset(
            'asset/icons/menu.png',
            height: MediaQuery.of(context).size.height * 0.0325,
            color: themeColor.black,
          ),
        ),
        styleAutoTittleName: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: themeColor.black
          ),
        elevationAppBar: 0,
        actionsAppBar: [
          Padding(
            padding: const EdgeInsets.all(15.0,),
            child: Image.asset('asset/logo.png'),
          )
        ],
        backgroundColorContent: themeColor.appBarThemeColor,
    );
    
  }
  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}