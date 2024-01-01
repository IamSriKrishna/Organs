import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/ModelScreen/ModelScreen.dart';
import 'package:mohan/Feature/Screen/Overscreen/Home/Widget/Card.dart';
import 'package:mohan/Model/Categories.dart';
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomCard(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(
                'Categories',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: themeColor.appblue,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.95,
            ), 
            itemCount: category.length,
            itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      if(category[index].title==category[6].title){
                        launchUrl(Uri.parse("https://www.mohanfoundation.org/tho/thobill1.asp"));
                      }else if(category[index].title==category[7].title){
                        launchUrl(Uri.parse("https://www.mohanfoundation.org/donorcard.asp"));
                      }else{
                        Get.to(()=>ModelScreen(
                        title: category[index].title,
                        json: category[index].json,
                      ));
                      }
                    },
                    child: CategoriesCard(
                      icon: category[index].icon,
                      title: category[index].title,
                    ),
                  ),
              );
            },
          )
        ],
      )
    );
  }
}