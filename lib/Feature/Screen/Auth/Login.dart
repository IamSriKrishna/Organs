import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomHiddenDrawer.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            //showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool proceed = false;
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: username,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w300
                      ),
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.grey.withOpacity(0.8),),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.grey.withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.grey.withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    enableSuggestions: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w300
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outlined,color: Colors.grey.withOpacity(0.8),),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.grey.withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0.2,
                          color: Colors.grey.withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.85, 
                      MediaQuery.of(context).size.height * 0.06
                    ),
                    backgroundColor: themeColor.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: ()async{
                    if(username.text.isEmpty||password.text.isEmpty){
                      if(username.text.isEmpty&&password.text.isEmpty){
                        
                        setState(() {
                          text = 'Username And Password is Empty';
                        });
                      }
                      else if(username.text.isEmpty){
                        setState(() {
                          text = 'Username is Empty';
                        });
                      }
                      else if(password.text.isEmpty){
                        setState(() {
                          text = 'Password is Empty';
                        });
                      }
                    }
                    else{
                      setState(() {
                        proceed = true;
                        text = '';
                      });
                      Future.delayed(Duration(seconds: 5)).then((value) => Navigator.pushNamedAndRemoveUntil(context, HiddenDrawer.route, (route) => false))
                      ;}
                  }, 
                  child: Text('Login')
                ),
              ),
              text!=''?Text(text,style: TextStyle(color: Colors.red),):Container(),
              
            ],
          ),
          proceed==true?Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 0,
              color: themeColor.black.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Lottie.asset(
                'asset/lottie/docload.json',
                height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
            ),
          ):Container()
        ],
      ),
    );
  }
  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               isDeviceConnected =
  //                   await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
}