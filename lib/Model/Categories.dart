// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    icon: 'asset/category/eye.png',
    background: Color.fromRGBO(108, 213, 197, 1),
    json: 'json/eyeJson.json'
  ),
  
  Categories(
    title: 'Skin Banks', 
    color: Color.fromRGBO(230, 106, 63, 1), 
    icon: 'asset/category/skin.png',
    background: Color.fromRGBO(253, 168, 139, 1),
    json: 'json/skinjson.json'
  ),
  Categories(
    title: 'Body Donations', 
    color: Color.fromRGBO(233, 79, 199, 1), 
    icon: 'asset/category/human-body.png',
    background: Color.fromRGBO(247, 159, 214, 1),
    json: 'json/bodyjson.json'
  ),
  
  Categories(
    title: 'Organ Transplant\nHospital', 
    color: Color.fromRGBO(61, 128, 233, 1), 
    icon: 'asset/category/hospital.png',
    background: Color.fromRGBO(155, 190, 244, 1),
    json: 'json/organjson.json'
  ),
  Categories(
    title: 'Non-Governmental\nOrganization', 
    color: Color.fromRGBO(41, 168, 194, 1), 
    icon: 'asset/category/ngo.png',
    background: Color.fromRGBO(142, 199, 211, 1),
    json: 'json/ngojson.json'
  ),
  
  Categories(
    title: 'Governmental\norganization', 
    color: Color.fromRGBO(125, 74, 228, 1), 
    icon: 'asset/category/government.png',
    background: Color.fromRGBO(188, 161, 242, 1),
    json: 'json/gojson.json'
  ),
];

class CategoriesCard extends StatelessWidget {
  final Color color;
  final Color background;
  final String icon;
  final String title;
  const CategoriesCard({
    super.key,
    required this.color,
    required this.background,
    required this.icon,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(icon,fit: BoxFit.fill,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: Container(
              alignment: Alignment.center,
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