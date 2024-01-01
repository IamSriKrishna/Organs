import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mohan/Util/util.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCard extends StatelessWidget {
  final String hospital_Name;
  final String address;
  final String city;
  final String pincode;
  final String state;
  const DetailCard({
    super.key,
    required this.hospital_Name,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode
  });
  Future<void> _launchMaps(String query) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$query';
    await launchUrl(Uri.parse(googleMapsUrl));
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10
        ),
        child: InkWell(
          onTap: () {
            _launchMaps(address);
          },
          child: Card(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('asset/map.png')
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$hospital_Name",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5
                            ),
                            child: Text(
                              "$address",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5
                            ),
                            child: Text(
                              "$city",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$state",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(
                                  Icons.directions,
                                  color: themeColor.appblue,
                                )
                              ],
                            ),
                          ),
                          Text(
                            "$pincode",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
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