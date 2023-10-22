import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mohan/Util/Screens.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomDrawer.dart';
import 'package:mohan/Widget/appbar/customAppbar.dart';
class OverScreen extends StatefulWidget {
  const OverScreen({super.key});

  @override
  State<OverScreen> createState() => _OverScreenState();
}

class _OverScreenState extends State<OverScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: themeColor.black,
        child: const CustomDrawer(),
      ),
      //appBar: customAppbar(context),
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.060,
        index: _currentIndex,
        items: [
        Image.asset(
          'asset/curve/home.png',
          height: MediaQuery.of(context).size.height * 0.0325,
          color: themeColor.green,
        ),
        Image.asset(
          'asset/curve/program.png',
          height: MediaQuery.of(context).size.height * 0.0325,
          color: themeColor.green,
        ),
        Image.asset(
          'asset/curve/calendar.png',
          height: MediaQuery.of(context).size.height * 0.0325,
          color: themeColor.green,
        )
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}