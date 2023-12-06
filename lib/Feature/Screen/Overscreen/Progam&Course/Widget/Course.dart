
import 'package:flutter/material.dart';
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
      img: 'asset/online-course.png',
      title: 'Transplant Coordination Professional Certificate', 
      urlId: '12'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Post Graduate Diploma in Transplant Coordination & Grief Counselling', 
      urlId: '2'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Family Counselling and Conversations on Organ Donation', 
      urlId: '10'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Legan Aspects of Organ Donation & Transplantation', 
      urlId: '18'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Brain Stem Death Identification, Certification and Donor Optimization', 
      urlId: '21'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Essential Course on Organ Donation for Medical Professionals', 
      urlId: '23'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Saving lives - A course for paramedical professionals', 
      urlId: '24'
    ),
    course.Course(
      img: 'asset/online-course.png',
      title: 'Gift of Life: One-day online certificate course on Organ Donation', 
      urlId: '9'
    ),
    course.Course(
      img: 'asset/telemedicine.png',
      title: 'Taking Care of your Kidneys', 
      urlId: '17'
    ),
    course.Course(
      img: 'asset/telemedicine.png',
      title: 'Taking Care of your Liver', 
      urlId: '19'
    ),
    course.Course(
      img: 'asset/telemedicine.png',
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
        return InkWell(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: ListTile(
                leading: Image.asset(
                  _course[index].img,
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                title: Text(_course[index].title),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: themeColor.blue,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
