
import 'package:flutter/material.dart';
import 'package:mohan/Model/programs.dart';
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';

class Program extends StatefulWidget {
  const Program({Key? key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  List<Programs> _programs = [
    Programs(
      title: 'Help Us Conduct an Awareness Program', 
      url: 'https://www.mohanfoundation.org/help-us-Conduct-an-awareness-program.asp'
    ),
    Programs(
      title: 'Become an Organ Donation Ambassdor', 
      url: 'https://www.mohanfoundation.org/angels-of-change.asp'
    ),
    Programs(
      title: 'Become a Life Member', 
      url: 'https://www.mohanfoundation.org/life-membership.asp'
    ),
    Programs(
      title: 'Become an Intern', 
      url: 'https://www.mohanfoundation.org/internships.asp'
    ),
    Programs(
      title: 'Subscribe to our Newsletter', 
      url: 'https://www.mohanfoundation.org/transplant-news-letter.asp'
    ),
    Programs(
      title: 'Help Us Fundraise', 
      url: 'https://www.mohanfoundation.org/help-us-fundraise.asp'
    ),
    Programs(
      title: 'Partner with Us', 
      url: 'https://www.mohanfoundation.org/partnership-with-trusts-and-ngos.asp'
    ),
  ];

  Future<void> link(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _programs.length,
      itemBuilder:(context, index) {
        return Card(
          elevation: 2.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: ListTile(
              title: Text(_programs[index].title),
              trailing: InkWell(
                onTap: (){
                  link(Uri.parse(_programs[index].url));
                }, 
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: themeColor.blue,
                  ),
                )
              ),
            ),
          ),
        );
      },
    );
  }
}
