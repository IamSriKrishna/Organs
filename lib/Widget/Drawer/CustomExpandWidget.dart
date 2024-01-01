import 'package:flutter/material.dart';

class CustomExpandWidget extends StatelessWidget {
  final String title;
  final String icon;
  final void Function() onTap;
  const CustomExpandWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.5,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Image.asset(icon,height: MediaQuery.of(context).size.height *0.04,),
                      ),
                      Text(title)
                    ],
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(right:10.0),
                //   child: Icon(Icons.arrow_forward_ios),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}