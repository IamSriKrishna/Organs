import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/Overscreen/Notification/Notifications.dart';
import 'package:mohan/Util/util.dart';
import 'package:badges/badges.dart' as badge;
AppBar customAppbar(BuildContext context){
  return AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.095,
        title: Text(
          'Mohan Foundation',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: themeColor.black
          ),
        ),
        elevation: 0,
        actions: [
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
        backgroundColor: themeColor.appBarThemeColor,
        leading: Builder(
          builder:(context) => IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }, 
            icon: Transform.flip(
              flipX: true,
              child: Image.asset(
                'asset/icons/menu.png',
                height: MediaQuery.of(context).size.height * 0.0325,
                color: themeColor.black,
              ),
            )
          ),
        ),
      );
}