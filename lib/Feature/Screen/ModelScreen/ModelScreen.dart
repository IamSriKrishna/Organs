// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Feature/Screen/ModelScreen/ModalExpand.dart';
import 'package:mohan/Util/util.dart';
import 'package:mohan/Widget/Extra/SearchShimmer.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
class ModelScreen extends StatefulWidget {
  final String title;
  final String json;
  static const route = '/ModelScreen';
  const ModelScreen({
    super.key,
    required this.title,
    required this.json,
  });

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  TextEditingController search = TextEditingController();
  bool isLoading = true;
  bool isError = false;
  List<dynamic> articles = [];
  List<dynamic> filteredArticles =[];
 Future<void> fetchNews() async {
  String apiUrl =
      'https://www.medindia.net/apps/jsondata/mf/emergency.asp?cat=${widget.json}&source=Android';
  
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (mounted) {
        setState(() {
          articles = jsonData['EmergencyDetails'];
          filteredArticles = articles.toList(); // Ensure a new instance for filteredArticles
          isLoading = false;
        });
        setState(() {});
      }
    } else {
      print('Error: Failed To fetch data');
      if (mounted) {
        setState(() {
          isError = true;
        });
      }
    }
  } catch (e) {
    print('Error: $e');
    if (mounted) {
      setState(() {
        isError = true;
      });
    }
  }
}
  shareApp(String query) async {
    await Share.shareUri(
      Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$query'
      )
    );
  }
  @override
  void initState() {
    super.initState();
    fetchNews();
  }
    void filterArticles(String searchText) {
    setState(() {
      filteredArticles = articles
          .where((article) =>
              article['state'].toString().toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
      void filtercity(String searchText) {
    setState(() {
      filteredArticles = articles
          .where((article) =>
              article['city'].toString().toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
  static const List<String> searchPlace = [
    "andhra pradesh",
    "arunachal pradesh",
    "assam",
    "bihar",
    "chhattisgarh",
    "goa",
    "gujarat",
    "haryana",
    "himachal pradesh",
    "jharkhand",
    "karnataka",
    "kerala",
    "madhya pradesh",
    "maharashtra",
    "manipur",
    "meghalaya",
    "mizoram",
    "nagaland",
    "odisha",
    "punjab",
    "rajasthan",
    "sikkim",
    "tamil nadu",
    "telangana",
    "tripura",
    "uttar pradesh",
    "uttarakhand",
    "west bengal"
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.title),
            floating: true,
            foregroundColor: Colors.white,
            backgroundColor: themeColor.appblue,
            bottom: PreferredSize(
              preferredSize: Size(
                double.infinity, 
                MediaQuery.of(context).size.height * 0.08
              ), 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child: Autocomplete<String>(
                      optionsMaxHeight: MediaQuery.of(context).size.height * 0.4,
                      onSelected: (String value) {
                        filterArticles(value);
                      },
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if(textEditingValue == ''){
                          return const Iterable<String>.empty();
                        }
                        return searchPlace.where((String place){
                          return place.contains(textEditingValue.text.toString().toLowerCase());
                        });
                      },
                      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            hintText: 'Search City or State',
                          ),
                          onChanged: (String value) {
                            filtercity(value);
                          },
                        );
                      },
                    ),
                  )
                ),
              )
            ),
          ),
          isError?SliverToBoxAdapter(
            child: Column(
              children: [
                Text("Time Out Due To lack Of Internet"),
                Image.asset('asset/flatIcon/not-found.gif'),
              ],
            ),
          ):
          isLoading? SearchShimmer():
          SliverList.builder(
            itemCount: filteredArticles.length,
            itemBuilder:(context, index) {
              // String originalString = filteredArticles[index]['phone'].toString();
              // int indexOfSlash = originalString.indexOf('/');
              return  InkWell(
                onTap: () {
                  Get.to(()=>
                    ModalExpand(
                      hospital_Name: filteredArticles[index]['hospital_name'],
                      address: filteredArticles[index]['address'],
                      city: filteredArticles[index]['city'],
                      state: filteredArticles[index]['state'],
                      phone: filteredArticles[index]['phone'],
                      email: filteredArticles[index]['email'],
                      website: filteredArticles[index]['website'],
                      pincode: filteredArticles[index]['pincode'],
                    )
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  elevation: 5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.175,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${filteredArticles[index]['hospital_name']}',
                                  maxLines: 1,
                                  style:  GoogleFonts.inter(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${filteredArticles[index]['address']}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style:  GoogleFonts.inter(
                                    color: Colors.grey
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  color: themeColor.red,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5
                                    ),
                                    child: Text(
                                      '${filteredArticles[index]['city']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style:  GoogleFonts.inter(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(),
                                      InkWell(
                                        onTap:()=> shareApp(filteredArticles[index]['address']),
                                        child: Card(
                                          elevation: 5,
                                          color: themeColor.appblue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal:8.0,
                                              vertical: 5
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.share,color: Colors.white,),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Share",
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color: themeColor.appblue,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          ),
                          child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}