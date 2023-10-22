import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mohan/Model/article.dart';
import 'package:mohan/Sql/sql_helper.dart';
import 'package:mohan/Util/util.dart';

class Program extends StatefulWidget {
  const Program({Key? key});

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  
  String convertStringToDateFormat(String inputString) {
  DateTime inputDate = DateTime.parse(inputString);
  DateFormat outputFormat = DateFormat('dd-MM-yyyy');
  String formattedDate = outputFormat.format(inputDate);

  return formattedDate;
}

  Future<List<Article>?> fetchNews() async {
    final url = 'https://newsapi.org/v2/everything?q=tesla&from=2023-09-22&sortBy=publishedAt&apiKey=54a0e3c6ed2246818154d2be69242bdd';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];
      
      //print(articles);
      return articles.map((dynamic article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

Future<void> _removeItem(String title) async {
  final isArticleInFavorites = _article.any((item) => item['title'] == title);

  if (isArticleInFavorites) {
    await SQLHelper.delete(title); // Implement the logic to delete the item
    _refreshArticle();
  }
}
  List<Map<String,dynamic>> _article= [];
  bool _isLoading = false;

  void _refreshArticle()async{
    final data = await SQLHelper.getItems();
    setState(() {
      _article = data;
      _isLoading = true;
    });
  }

Future<void> _addItem(String title, String description, String publishedAt, String imageUrl) async {
  // Check if the article is already in the favorites list
  final isArticleAlreadyAdded = _article.any((item) => item['title'] == title);

  if (!isArticleAlreadyAdded) {
    await SQLHelper.CreateItem(
      title, 
      description, 
      publishedAt, 
      imageUrl
    );
    _refreshArticle();
  } else {
    // Article is already in favorites, you can show a message or take some action
    // For example, you can show a snackbar with a message:
    final snackBar = SnackBar(
      content: Text('Article is already in favorites'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

  @override
  void initState() {
    super.initState();
    _refreshArticle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchNews(),
      builder: (BuildContext context,AsyncSnapshot<List<Article>?> snapshot) {
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                  'asset/lottie/docload.json',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Text('${snapshot.error}')
            ],
          );
        } else if (snapshot.hasData) {
            var items = snapshot.data as List<Article>;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              bool isFavorite = _article.any((item) => item['title'] == items[index].title);
              String formattedDate = convertStringToDateFormat(items[index].publishedAt);
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
                          child: Stack(
                            children: [
                              Column(
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
                              
                              Align(
                                alignment: Alignment(1.2,-1.5),
                                child: IconButton(
                                  onPressed: () async{
                                    if (!isFavorite) {
                                      await _addItem(
                                        items[index].title,
                                        items[index].description,
                                        items[index].publishedAt,
                                        items[index].url,
                                      );
                                    } else {
                                      await _removeItem(items[index].title);
                                    }
                                  },
                                  icon: Icon(isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                    color: isFavorite ? Colors.red : null,
                                  ),
                                ),
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
            child: Lottie.asset(
                  'asset/lottie/docload.json',
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
          );
        }
      },
    );
  }
}
