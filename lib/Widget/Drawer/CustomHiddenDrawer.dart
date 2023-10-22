import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:mohan/Feature/Screen/Auth/Login.dart';
import 'package:mohan/Feature/Screen/BookmarkScreen/BookMarkScreen.dart';
import 'package:mohan/Feature/Screen/Overscreen/More/MoreOption.dart';
import 'package:mohan/Feature/Screen/Overscreen/Notification/Notifications.dart';
import 'package:mohan/Feature/Screen/Overscreen/OverScreen.dart';
import 'package:mohan/Util/util.dart';
import 'package:badges/badges.dart' as badge;
import 'package:url_launcher/url_launcher.dart';
class HiddenDrawer extends StatefulWidget {
  static const route = 'HiddenDrawer';
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  Future<void> _website(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url,);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw 'can not launch';
    }
  }
  @override
  void initState() {
    
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: themeColor.lightblue,
          name: 'Mohan Foundation', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        const OverScreen()
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: Colors.red,
          name: 'BookMark', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        BookmarkPage()
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          colorLineSelected: themeColor.green,
          name: 'More Option', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        const MoreOption()
      ),
      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     colorLineSelected: themeColor.black,
      //     name: 'Profile', 
      //     baseStyle: const TextStyle(), 
      //     selectedStyle: const TextStyle(),
      //   ), 
      //   const Scaffold()
      // ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(
              context, 
              LoginScreen.route,
              ((route) => false)
            );
          },
          colorLineSelected: themeColor.card,
          name: 'Sign Out', 
          baseStyle: const TextStyle(), 
          selectedStyle: const TextStyle(),
        ), 
        const Scaffold()
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
          InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Notifications.route);
                },
            child: Padding(
              padding: const EdgeInsets.only(top:15.0,right: 8),
              child: badge.Badge(
                position: badge.BadgePosition.custom(start: 1.5),
                child: Icon(Icons.notifications_outlined,color: themeColor.black,),
              ),
            ),
          )
        ],
        backgroundColorContent: themeColor.appBarThemeColor,
    );
    
  }
}