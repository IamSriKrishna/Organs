import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:mohan/Util/util.dart';
void showSnackBarWithIndicator(BuildContext context,String email) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GlassContainer(
        blur: 2,
        color: themeColor.appblue,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                email,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8
              ),
              child: Icon(Icons.copy,color: Colors.white,),
            )
          ],
        ),
      ),
    ),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


List<String> extractNumbers(String inputString) {
  RegExp regExp = RegExp(r'\d+(\s*[,\|/\\]?\s*)\d+');
  Iterable<RegExpMatch> matches = regExp.allMatches(inputString);
  
  List<String> numbersList = [];
  
  for (RegExpMatch match in matches) {
    String number = match.group(0)!;
    numbersList.add(number.replaceAll(RegExp(r'[,\|/\\]'), '')); // Remove specified characters
  }
  
  return numbersList;
}

void showModal(BuildContext context,String phone) {
  List<String> phoneList = phone.split(' / ').map((e) => e.replaceAll('\\', '')).toList();

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Phone Numbers'),
          actions: [
            for (String number in phoneList)
              CupertinoDialogAction(
                child: Text(number),
              ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        );
      },
    );
  }