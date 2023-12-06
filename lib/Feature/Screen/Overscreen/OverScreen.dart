import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mohan/Util/Screens.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomDrawer.dart';
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
        height: MediaQuery.of(context).size.height * 0.055,
        index: _currentIndex,
        items: [
        _currentIndex==0?
        Icon(
          Icons.home_outlined,
          color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_outlined,
              color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
            ),
            Text('Home')
          ],
        ),
        _currentIndex==1?
        Icon(
          Icons.contact_support,
          color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.contact_support,
              color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
            ),
            Text('Support')
          ],
        ),
        // Image.asset(
        //   'asset/curve/home.png',
        //   height: MediaQuery.of(context).size.height * 0.0325,
        //   color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
        // ),
        // Image.asset(
        //   'asset/curve/program.png',
        //   height: MediaQuery.of(context).size.height * 0.0325,
        //   color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
        // ),
        // Image.asset(
        //   'asset/curve/calendar.png',
        //   height: MediaQuery.of(context).size.height * 0.0325,
        //   color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
        // )
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