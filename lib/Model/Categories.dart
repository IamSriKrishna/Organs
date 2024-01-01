// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Util/util.dart';

class Categories {
  final String title;
  final Color color;
  final Color background;
  final String icon;
  final String json;
  const Categories({
    required this.title,
    required this.color,
    required this.icon,
    required this.background,
    required this.json
  });
}

List<Categories> category = const[
  Categories(
    title: 'Eye Banks', 
    color: Color.fromRGBO(30, 187, 164, 1), 
    icon: 'asset/category/eye (1).png',
    background: Color.fromRGBO(108, 213, 197, 1),
    json: 'Eye+Bank'
  ),
  
  Categories(
    title: 'Skin Banks', 
    color: Color.fromRGBO(230, 106, 63, 1), 
    icon: 'asset/category/depilation.png',
    background: Color.fromRGBO(253, 168, 139, 1),
    json: 'Skin+Bank'
  ),
  Categories(
    title: 'Body Donations', 
    color: Color.fromRGBO(233, 79, 199, 1), 
    icon: 'asset/category/human-body.png',
    background: Color.fromRGBO(247, 159, 214, 1),
    json: 'Body+Donation'
  ),
  
  Categories(
    title: 'Organ Transplant\nHospital', 
    color: Color.fromRGBO(61, 128, 233, 1), 
    icon: 'asset/category/hospital.png',
    background: Color.fromRGBO(155, 190, 244, 1),
    json: 'Govt+Bodies'
  ),
  Categories(
    title: 'Non-Governmental\nOrganization', 
    color: Color.fromRGBO(41, 168, 194, 1), 
    icon: 'asset/category/ngo.png',
    background: Color.fromRGBO(142, 199, 211, 1),
    json: 'NGOs+List'
  ),
  
  Categories(
    title: 'Governmental\norganization', 
    color: Color.fromRGBO(125, 74, 228, 1), 
    icon: 'asset/category/government.png',
    background: Color.fromRGBO(188, 161, 242, 1),
    json: 'transplant'
  ),
  Categories(
    title: 'Laws On\nTransplantation', 
    color: Color.fromRGBO(125, 74, 228, 1), 
    icon: 'asset/category/compliant.png',
    background: Color.fromRGBO(188, 161, 242, 1),
    json: 'json/gojson.json'
  ),
  Categories(
    title: 'Pledge Your\nOrgans', 
    color: Color.fromRGBO(125, 74, 228, 1), 
    icon: 'asset/category/pledge.png',
    background: Color.fromRGBO(188, 161, 242, 1),
    json: 'json/gojson.json'
  ),
];

class CategoriesCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color? color;
  const CategoriesCard({
    super.key,
    required this.icon,
    required this.title,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      color: themeColor.appblue,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  icon,fit: BoxFit.fill,color: color,),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeColor.appblue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style:  GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}