import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mohan/Model/article.dart';
import 'package:mohan/Util/util.dart';

class Course extends StatelessWidget {
  const Course({Key? key});

  Future<List<Article>?> fetchNews() async {
    // final apiKey = 'f8da4dc7f0ac4238bc9f784d18afae7e';
    final url = 'https://newsapi.org/v2/everything?q=death&from=2023-09-30&sortBy=publishedAt&apiKey=f8da4dc7f0ac4238bc9f784d18afae7e';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];
      return articles.map((dynamic article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
  Future onRefresh()async{
    fetchNews();
  }
  String convertStringToDateFormat(String inputString) {
  DateTime inputDate = DateTime.parse(inputString);
  DateFormat outputFormat = DateFormat('dd-MM-yyyy');
  String formattedDate = outputFormat.format(inputDate);

  return formattedDate;
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews(),
      builder: (BuildContext context,AsyncSnapshot<List<Article>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Center(
              child: Lottie.asset(
                'asset/lottie/docload.json',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.4,
              )),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                  'asset/lottie/docload.json',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Text('No Internet Connection')
            ],
          );
        } else if (snapshot.hasData) {
            var items = snapshot.data as List<Article>;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              String formattedDate = convertStringToDateFormat(items[index].publishedAt!);
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: CachedNetworkImage(
                            imageUrl: '${items[index].url}',
                            imageBuilder: (context, imageProvider) => Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Center(child: Lottie.asset('asset/lottie/docload.json'))
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Icon(Icons.error)
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${items[index].title}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: themeColor.green
                                ),
                              ),
                              Text(
                                '${items[index].description}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.inter(
                                  color: themeColor.black.withOpacity(0.5)
                                ),
                              ),
                              Text(
                                '${formattedDate}',
                                style: GoogleFonts.inter(
                                  color: themeColor.green
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text('No data available.'),
          );
        }
      },
    );
  }
}
