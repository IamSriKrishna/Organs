import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Util/util.dart';

class Notifications extends StatelessWidget {
  static const route = '/Notifications';
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: themeColor.black,),
        ),
        backgroundColor: themeColor.appBarThemeColor,
        title: Text(
          'Notification',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 22,
            color: themeColor.black
          ),
        ),
      ),
    );
  }
}