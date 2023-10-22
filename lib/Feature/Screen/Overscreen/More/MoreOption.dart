import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomExpandWidget.dart';
import 'package:mohan/Widget/Extra/WebScreen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreOption extends StatelessWidget {
  const MoreOption({super.key});

  shareApp() async {
    await Share.share("Mohan Foundation", subject: "Organ Donation");
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'store');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }
  Future<void> uTube(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'mohanfoundation' ,query: 'si=plTMRk3cScFCmgSO');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }

  Future<void> x(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'mohanfoundation');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }
  Future<void> insta(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'mohanfoundations');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }
  Future<void> linkedIn(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'company/mohan-foundation/');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }
  Future<void> meta(String url) async {
    final Uri uri = Uri(scheme: 'https', host: url, path: 'MOHANFoundationIndia');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'can not launch';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/mohan.png'),
              CustomExpandWidget(
                title: 'Contact Us',
                icon: image.phone,
                onTap: ()async {
                  final Uri uri = Uri(
                    scheme: 'tel',
                    path: '1800 103 7100',
                  );
                  if(await canLaunchUrl(uri)){
                    await launchUrl(uri);
                  }
                },
              ),
              CustomExpandWidget(
                title: 'About Us',
                icon: image.aboutUs,
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => const WebviewScreen(title: 'Our Website'),)
                  );
                },
              ),
              CustomExpandWidget(
                title: 'Feedback',
                icon: image.feedback,
                onTap: () {
                  _launchUrl('play.google.com');
                },
              ),
              CustomExpandWidget(
                title: 'Rate Us',
                icon: image.rateUS,
                onTap: () {
                  _launchUrl('play.google.com');
                },
              ),
              CustomExpandWidget(
                title: 'Share',
                icon: image.share,
                onTap: () {
                  shareApp();
                },
              ),
              CustomExpandWidget(
                title: 'Our Website',
                icon: image.ourWebsite,
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder:(context) => const WebviewScreen(title: 'Our Website'),)
                  );
                },
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Follow Us',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: themeColor.black
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              x('twitter.com');
                            },
                            child: Image.asset(
                              image.x,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              uTube('youtube.com');
                            },
                            child: Image.asset(
                              image.uTube,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              linkedIn('www.linkedin.com');
                            },
                            child: Image.asset(
                              image.linkedIn,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              meta('www.facebook.com');
                            },
                            child: Image.asset(
                              image.meta,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              insta('www.instagram.com');
                            },
                            child: Image.asset(
                              image.insta,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
    );
  }
}