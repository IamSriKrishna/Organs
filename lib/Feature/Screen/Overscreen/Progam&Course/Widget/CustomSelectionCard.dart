import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Util/util.dart';

class CustomSelectionCard extends StatefulWidget {
  String countryCode;
  final String countryName;
  String askCounrtycode;
  int clicked;
  int clickedId;
  CustomSelectionCard({
    super.key,
    required this.countryCode,
    required this.countryName,
    required this.clicked,
    required this.clickedId,
    required this.askCounrtycode
  });

  @override
  State<CustomSelectionCard> createState() => _CustomSelectionCardState();
}

class _CustomSelectionCardState extends State<CustomSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10,),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.clicked = widget.clickedId;
            widget.askCounrtycode = widget.countryCode;
          });
          print(widget.countryCode);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.clicked == widget.clickedId? themeColor.green:Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              widget.countryName,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            )),
        )),
    );
  }
}