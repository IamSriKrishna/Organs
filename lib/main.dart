import 'package:flutter/material.dart';
import 'package:mohan/Feature/Screen/Overscreen/OverScreen.dart';
import 'package:mohan/Widget/Drawer/CustomHiddenDrawer.dart';
import 'package:mohan/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiddenDrawer(),
      onGenerateRoute: (settings) => onGenerator(settings),
    );
  }
}
