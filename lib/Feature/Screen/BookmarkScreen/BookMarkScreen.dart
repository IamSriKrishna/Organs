import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mohan/Sql/sql_helper.dart';
import 'package:mohan/Util/util.dart';

class BookmarkPage extends StatefulWidget {
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
    
  String convertStringToDateFormat(String inputString) {
  DateTime inputDate = DateTime.parse(inputString);
  DateFormat outputFormat = DateFormat('dd-MM-yyyy');
  String formattedDate = outputFormat.format(inputDate);

  return formattedDate;
}
  List<Map<String,dynamic>> _article= [];
  bool _isLoading = false;

  void _refreshArticle()async{
    final data = await SQLHelper.getItems();
    setState(() {
      _article = data;
      _isLoading = true;
    });
    print('Number Of Items ${_article.length}'); 
  }

void _DeleteItem(String title, int index) async {
  if (index >= 0 && index < _article.length) {
    await SQLHelper.delete(title);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Successfully deleted\n$title'),
    ));

    setState(() {
      // Create a copy of the _article list
      List<Map<String, dynamic>> updatedList = List.from(_article);

      // Remove the item from the copy
      updatedList.removeAt(index);

      // Update the state with the modified list
      _article = updatedList;

      print('Number Of Items ${_article.length}');
    });
  }
}
  @override
  void initState() {
    super.initState();
    _refreshArticle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_article.isEmpty? 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Oops, it looks like your bookmark list is empty\nStart saving your favorite items to\nkeep track of them here!',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: themeColor.black
            ),  
          ),
          Lottie.asset('asset/lottie/bookmark.json'),
        ],
      )
      :ListView.builder(
        itemCount: _article.length,
        itemBuilder: (context, index) {
          String formattedDate = convertStringToDateFormat(_article[index]['publishedAt']);
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
                            imageUrl: '${_article[index]['image']}',
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
                                    '${_article[index]['title']}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: themeColor.green
                                    ),
                                  ),
                                  Text(
                                    '${_article[index]['description']}',
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
                                alignment: Alignment(1,1.3),
                                child: IconButton(
                                  onPressed: () {
                                    _DeleteItem(_article[index]['title'],index);
                                  },
                                  icon: Icon(Icons.delete,color: Colors.red,)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
