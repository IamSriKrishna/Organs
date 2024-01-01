import 'package:flutter/material.dart';
import 'package:mohan/Feature/Screen/Overscreen/OverScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> splashNavigateTo()async{
    await Future.delayed(
      Duration(seconds: 1),
      (){
        Navigator.of(context).pushNamedAndRemoveUntil(
          OverScreen.route, (route) => false);
      }
    );
  }

  @override
  void initState() {
    splashNavigateTo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset("asset/mohan.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "asset/splash/med.png",
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              "Organ Donation\nApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}