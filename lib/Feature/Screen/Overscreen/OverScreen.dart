import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mohan/Util/Screens.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomDrawer.dart';
class OverScreen extends StatefulWidget {
  static const route = '/OverScreen';
  const OverScreen({super.key});

  @override
  State<OverScreen> createState() => _OverScreenState();
}

class _OverScreenState extends State<OverScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOHAN Foundation'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('asset/logo.png'),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: themeColor.appblue,
        child: const CustomDrawer(),
      ),
      //appBar: customAppbar(context),
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.065,
        index: _currentIndex,
        items: [
        _currentIndex==0?
        Image.asset(
          "asset/curve/home1.png",
          height: MediaQuery.of(context).size.height * 0.045,
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
          "asset/curve/home1.png",
          height: MediaQuery.of(context).size.height * 0.045,
        ),
            Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeColor.appblue
              ),
            )
          ],
        ),
        _currentIndex==1?
        Image.asset(
          "asset/curve/graduation.png",
          height: MediaQuery.of(context).size.height * 0.045,
        ):
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/curve/graduation.png",
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Text(
              'Support',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: themeColor.appblue
              ),
            
              )
          ],
        ),
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