// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohan/Model/jsonModel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ModelScreen extends StatefulWidget {
  static const route = '/ModelScreen';
  const ModelScreen({
    super.key,
    
  });

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  late final String jsondata;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modal = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final json = modal['json'];
    jsondata = json;
  }

  Future<List<JsonModel>?> readJsonData() async {
    try {
      final jsonData = await rootBundle.loadString(jsondata);
      final list = json.decode(jsonData) as List<dynamic>;
      return list.map((e) => JsonModel.fromJson(e)).toList();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error loading JSON data: $e")));
      return null;
    }
  }

  
  shareApp(String title,String location) async {
    await Share.share(title, subject: location);
  }
  @override
  Widget build(BuildContext context) {
    final modal = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>; // Specify the type of the map value.
    final color = modal['color'] as Color; 
    final backgroundcolor = modal['back'] as Color; 
    final title = modal['title']; 
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 15,
        backgroundColor: backgroundcolor,
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          }, 
          child: const Icon(Icons.arrow_back_ios_new)
        ),
      ),
      body: FutureBuilder(
        future: readJsonData(), 
        builder:(context, data) {
          if(data.hasError){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(data.hasData){
            var items = data.data as List<JsonModel>;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder:(context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  elevation: 5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${items[index].hospitalName}',
                                  maxLines: 2,
                                  style:  GoogleFonts.inter(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '${items[index].hospitalAddress}',
                                  overflow: TextOverflow.ellipsis,
                                  style:  GoogleFonts.inter(
                                    color: Colors.grey
                                  ),
                                ),
                                Row(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      color: color.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: ()async {
                                            final Uri uri = Uri(
                                              scheme: 'tel',
                                              path: '${items[index].number}',
                                            );
                                            if(await canLaunchUrl(uri)){
                                              await launchUrl(uri);
                                            }
                                          },
                                          child: Text(
                                            '${items[index].number}',
                                            overflow: TextOverflow.ellipsis,
                                            style:  GoogleFonts.inter(
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 0,
                                      color: color.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: ()async {
                                            shareApp('${items[index].hospitalName}','${items[index].hospitalAddress}');
                                            
                                          },
                                          child: Text(
                                            'Share 🔗',
                                            overflow: TextOverflow.ellipsis,
                                            style:  GoogleFonts.inter(
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color: backgroundcolor.withOpacity(0.5),
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
                );
              },
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } ,
      ),
    );
  }
}