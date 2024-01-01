import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohan/Feature/Screen/ModelScreen/Widget/CustomSnackBar.dart';
import 'package:mohan/Feature/Screen/ModelScreen/Widget/DetailCard.dart';
import 'package:mohan/Util/util.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalExpand extends StatefulWidget {
  final String hospital_Name;
  final String address;
  final String city;
  final String state;
  final String phone;
  final String email;
  final String website;
  final String pincode;
  const ModalExpand({
    super.key,
    required this.hospital_Name,
    required this.address,
    required this.city,
    required this.state,
    required this.phone,
    required this.email,
    required this.website,
    required this.pincode
  });

  @override
  State<ModalExpand> createState() => _ModalExpandState();
}

class _ModalExpandState extends State<ModalExpand> {
  shareApp(String query) async {
    await Share.shareUri(
      Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$query'
      )
    );
  }

  

  @override
  Widget build(BuildContext context) {
    _copy(String mail){
      final value = ClipboardData(text: mail);
      Clipboard.setData(value).then((value) => showSnackBarWithIndicator(context,mail));
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: themeColor.red,
            title: Text(widget.hospital_Name),
          ),
          DetailCard(
            hospital_Name: widget.hospital_Name, 
            address: widget.address, 
            city: widget.city, state: widget.state,
            pincode: widget.pincode,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.phone==""?"Not Found":
                    "${widget.phone}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  InkWell(
                    onTap:()=>widget.email==""?null: _copy(widget.email),
                    child: Text(
                      widget.email==""?
                      "Not Found":
                      "${widget.email}",
                      style: TextStyle(
                        fontSize: 18,
                        color:widget.email==""?Colors.black: Colors.blue
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Website:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                      final String url = "https://${widget.website}";
                      print("https://${widget.website}");
                      final String finalUrl = url.replaceAll("http://", "");
                      url.contains(",")?
                      await launchUrl(Uri.parse(finalUrl.replaceAll(',', ''))):
                      await launchUrl(Uri.parse(finalUrl));
                    },
                    child: Text(widget.website==""?
                      "Not Found":
                      "${widget.website}",
                      style: TextStyle(
                        fontSize: 18,
                        color:widget.website==""?null: themeColor.blue
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5)
                ),
                backgroundColor: themeColor.appblue,
                foregroundColor: themeColor.card,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.45,
                  MediaQuery.of(context).size.height * 0.05
                )
              ),
              onPressed: (){
                List<String> outputList = widget.phone
                  .split(RegExp(r'[\/,\\]')) 
                  .map((String item) => item.replaceAll(RegExp(r'[^\w\s-]'), '').trim())
                  .where((String item) => item.isNotEmpty)
                  .toList();
                if(outputList.length==0){
                }else if(outputList.length==1){
                  launchUrl(Uri(
                    scheme: 'tel',
                    path: widget.phone,
                  ));
                }else{
                  displayListInCupertinoModalPopup();
                }
              }, 
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Contact"),
                ],
              )
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5)
                ),
                backgroundColor: themeColor.red,
                foregroundColor: themeColor.card,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.45,
                  MediaQuery.of(context).size.height * 0.05
                )
              ),
              onPressed:()=> shareApp(widget.address), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Share"),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
  void displayListInCupertinoModalPopup() {
    List<String> outputList = widget.phone
      .split(RegExp(r'[\/,\\]')) 
      .map((String item) => item.replaceAll(RegExp(r'[^\w\s-]'), '').trim())
      .where((String item) => item.isNotEmpty)
      .toList();
  showCupertinoModalPopup(
    context: context, // Replace with your context
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50
          ),
          child: CupertinoActionSheet(
            title: Text(
              'Select Contact',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [
                for (String number in outputList)
                  CupertinoDialogAction(
                    child: Text(
                      number,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: () {
                      launchUrl(Uri(
                        scheme: 'tel',
                        path: number,
                      ));
                    },
                  ),
              ],
          ),
        ),
      );
    },
  );
}
}