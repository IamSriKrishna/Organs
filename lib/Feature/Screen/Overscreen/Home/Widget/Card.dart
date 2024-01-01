import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0,left: 15.0,right: 15,bottom: 10),
      child: GestureDetector(
        onTap: ()async {
          final Uri uri = Uri(
            scheme: 'tel',
            path: '1800 103 7100',
          );
          if(await canLaunchUrl(uri)){
            await launchUrl(uri);
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeColor.red,
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('asset/card2.png'))
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Text(
                            'Helpline - 24/7',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            'In 8 Languages',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Text(
                        '1800 103 7100',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}