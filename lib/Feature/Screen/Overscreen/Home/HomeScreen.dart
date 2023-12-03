import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/ModelScreen/ModelScreen.dart';
import 'package:mohan/Feature/Screen/Overscreen/Home/Widget/Card.dart';
import 'package:mohan/Model/Categories.dart';

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
                  color: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
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
                        Navigator.of(context).pushNamed(
                          ModelScreen.route,
                          arguments: {
                            'color':Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
                            'back':Color.fromRGBO(236, 22, 31, 1).withOpacity(0.75),
                            'title':category[index].title,
                            'json':category[index].json,
                          }
                        );
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