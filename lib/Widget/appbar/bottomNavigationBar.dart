// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mohan/Util/util.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int currentIndex;
  CustomBottomNavigationBar({super.key,required this.currentIndex});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.060,
      index: widget.currentIndex,
      items: [
      Image.asset(
        'asset/curve/home.png',
        height: MediaQuery.of(context).size.height * 0.0325,
        color: themeColor.black,
      ),
      Image.asset(
        'asset/curve/program.png',
        height: MediaQuery.of(context).size.height * 0.0325,
        color: themeColor.black,
      ),
      Image.asset(
        'asset/curve/calendar.png',
        height: MediaQuery.of(context).size.height * 0.0325,
        color: themeColor.black,
      )
      ],
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;
        });
      },
    );
  }
}