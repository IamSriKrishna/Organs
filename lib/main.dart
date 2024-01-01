import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohan/SplashScreen.dart';
import 'package:mohan/Util/localNotification.dart';
import 'package:mohan/route.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: (settings) => onGenerator(settings),
    );
  }
}
