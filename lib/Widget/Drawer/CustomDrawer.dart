import 'package:flutter/material.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Drawer/CustomExpandWidget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse('https://play.google.com/store/apps/details?id=mohanfoundation.helplineapp');
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Cannot launch';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Container(
            child: Image.asset('asset/mohan.png'),
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Organ Donation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomExpandWidget(
                title: 'Contact Us',
                icon: image.phone,
                onTap: ()async {
                  await launchUrl(Uri.parse("https://www.mohanfoundation.org/contact.asp"));
                },
              ),
              CustomExpandWidget(
                title: 'About Us',
                icon: image.aboutUs,
                onTap: () async{
                  await launchUrl(Uri.parse("https://www.mohanfoundation.org/who.asp"));
                },
              ),
              CustomExpandWidget(
                title: 'FAQ',
                icon: image.faq,
                onTap: () async{
                  await launchUrl(Uri.parse("https://www.mohanfoundation.org/faqs.asp"));
                },
              ),
              CustomExpandWidget(
                title: 'Feedback',
                icon: image.feedback,
                onTap: () async{
                  await launchUrl(Uri.parse("https://www.mohanfoundation.org/feedback.asp"));
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
                  Share.shareUri(Uri.parse("https://play.google.com/store/apps/details?id=mohanfoundation.helplineapp"));
                },
              ),
              CustomExpandWidget(
                title: 'Our Website',
                icon: image.ourWebsite,
                onTap: ()async {
                  await launchUrl(Uri.parse("https://www.mohanfoundation.org"));
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Follow Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38
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
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                uTube('youtube.com');
                              },
                              child: Image.asset(
                                image.uTube,
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                linkedIn('www.linkedin.com');
                              },
                              child: Image.asset(
                                image.linkedIn,
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                meta('www.facebook.com');
                              },
                              child: Image.asset(
                                image.meta,
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                            InkWell(
                              onTap: () async{
                                await launchUrl(Uri.parse("https://www.instagram.com/mohanfound/?igsh=MTZnZHI1aGtzeGIyag%3D%3D"));
                              },
                              child: Image.asset(
                                image.insta,
                                height: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}