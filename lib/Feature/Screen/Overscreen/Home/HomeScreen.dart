import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/ModelScreen/ModelScreen.dart';
import 'package:mohan/Feature/Screen/Overscreen/Home/Widget/Card.dart';
import 'package:mohan/Model/Categories.dart';
import 'package:mohan/Util/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CustomCard(),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text(
              'Categories',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: themeColor.green,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.76,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5
                ), 
                itemCount: category.length,
                itemBuilder:(context, index) => InkWell(
                  onTap: () {
                      Navigator.of(context).pushNamed(
                        ModelScreen.route,
                        arguments: {
                          'color':category[index].color,
                          'back':category[index].background,
                          'title':category[index].title,
                          'json':category[index].json,
                        }
                      );
                  },
                  child: CategoriesCard(
                    color: category[index].color,
                    background: category[index].background,
                    icon: category[index].icon,
                    title: category[index].title,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}