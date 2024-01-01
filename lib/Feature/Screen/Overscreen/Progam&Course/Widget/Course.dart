
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Model/programs.dart' as course;
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';

class Course extends StatefulWidget {
  const Course({Key? key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  List<course.Course> _course = [
    course.Course(
      img: 'asset/course/1.png',
      title: 'Transplant Coordination Professional Certificate', 
      urlId: '12'
    ),
    course.Course(
      img: 'asset/course/2.png',
      title: 'Post Graduate Diploma in Transplant Coordination & Grief Counselling', 
      urlId: '2'
    ),
    course.Course(
      img: 'asset/course/3.png',
      title: 'Family Counselling and Conversations on Organ Donation', 
      urlId: '10'
    ),
    course.Course(
      img: 'asset/course/4.png',
      title: 'Legan Aspects of Organ Donation & Transplantation', 
      urlId: '18'
    ),
    course.Course(
      img: 'asset/course/5.png',
      title: 'Brain Stem Death Identification, Certification and Donor Optimization', 
      urlId: '21'
    ),
    course.Course(
      img: 'asset/course/6.png',
      title: 'Essential Course on Organ Donation for Medical Professionals', 
      urlId: '23'
    ),
    course.Course(
      img: 'asset/course/7.png',
      title: 'Saving lives - A course for paramedical professionals', 
      urlId: '24'
    ),
    course.Course(
      img: 'asset/course/8.png',
      title: 'Gift of Life: One-day online certificate course on Organ Donation', 
      urlId: '9'
    ),
    course.Course(
      img: 'asset/course/9.png',
      title: 'Taking Care of your Kidneys', 
      urlId: '17'
    ),
    course.Course(
      img: 'asset/course/10.png',
      title: 'Taking Care of your Liver', 
      urlId: '19'
    ),
    course.Course(
      img: 'asset/course/11.png',
      title: 'Taking Care of your Lungs', 
      urlId: '20'
    ),
  ];

  Future<void> link(Uri _urlId) async {
    if (!await launchUrl(_urlId)) {
      throw Exception('Could not launch $_urlId');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: _course.length,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              link(Uri.parse('https://el.mohanfoundation.org/mf/coursedetails.php?courseid=${_course[index].urlId}'));
            },
            child: Card(
              elevation: 2.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15
                )
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width *0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_course[index].img)
                        )
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10
                        ),
                        child: Text(
                          _course[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
/**ListTile(
                leading: Image.asset(
                  _course[index].img,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.07,
                  fit: BoxFit.fitHeight,
                ),
                title: ,
              ) */