import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/Overscreen/Progam&Course/Widget/Course.dart';
import 'package:mohan/Feature/Screen/Overscreen/Progam&Course/Widget/Program.dart';
import 'package:mohan/Util/util.dart';

class ProgramandCourse extends StatelessWidget {
  const ProgramandCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              indicatorColor: themeColor.blue,
              indicatorWeight: 2.5,
              tabs: [
                Tab(
                  child: Text(
                    'Support',
                    style: GoogleFonts.inter(
                      color: themeColor.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Courses',
                    style: GoogleFonts.inter(
                      color: themeColor.black,
                      fontSize: 16.5,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ]
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Program(),
                  Course(),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}