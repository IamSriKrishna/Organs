import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Model/mohan.dart';

class NewsandEvent extends StatefulWidget {
  const NewsandEvent({super.key});

  @override
  State<NewsandEvent> createState() => _NewsandEventState();
}

class _NewsandEventState extends State<NewsandEvent> {
List<Mohan> _mohan = [
  Mohan(title: 'Latest News'),
  Mohan(title: 'MOHAN Foundation\nblog'),
  Mohan(title: 'Transplant News\nblog'),
  Mohan(title: 'MOHAN Foundation\npress release'),
  Mohan(title: 'Press and media'),
];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        bottomOpacity: 5,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'News and Events',
          style: GoogleFonts.merriweather(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _mohan.length,
        itemBuilder:(context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            shadowColor: Color.fromRGBO(6, 43, 119, 1).withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: width * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('asset/cat/cat${index+1}.png'))
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    width: width * 0.7,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:Color.fromRGBO(236, 22, 31, 1).withOpacity(0.75),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)
                      )
                    ),
                    child: Text(
                      _mohan[index].title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.merriweather(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}