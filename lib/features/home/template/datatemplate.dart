import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../constants/dimens.dart';

class CompleteData extends StatefulWidget {
  const CompleteData({super.key});

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  List _items = [];

  Future<List> readJson() async {
    final String resposne = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(resposne);
    setState(() {
      _items = data["content"]["data"];
    });
    return _items;
  }

  String formatDateTime(String inputDateTime) {
    final dateTime = DateTime.parse(inputDateTime);
    final format = DateFormat("E, MMM d • h:mm a");
    final formattedDate = format.format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.scaleH(20),
      ),
      child: FutureBuilder(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final eventData = snapshot.data;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: eventData?.length ?? 0,
              itemBuilder: (context, index) {
                final dateFormatted =
                    formatDateTime(eventData?[index]["date_time"]);
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.scaleW(8),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          height: Dimensions.scaleH(80),
                          width: Dimensions.scaleW(60),
                          imageUrl: eventData?[index]["banner_image"],
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: Dimensions.scaleW(15)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dateFormatted,
                              style: TextStyle(
                                color: const Color(0xFF5669ff),
                                fontSize: Dimensions.scaleH(16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.scaleH(2)),
                              child: Text(
                                eventData?[index]["venue_name"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Dimensions.scaleH(20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.scaleH(3)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: const Color(0xFFb0b1bc),
                                    size: Dimensions.scaleH(20),
                                  ),
                                  Text(
                                    eventData?[index]['venue_city'],
                                    softWrap: true,
                                    style: TextStyle(
                                      color: const Color(0xFFb0b1bc),
                                      fontSize: Dimensions.scaleH(15),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    softWrap: true,
                                    " • ",
                                    style: TextStyle(
                                      color: const Color(0xFFb0b1bc),
                                      fontSize: Dimensions.scaleH(15),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    eventData?[index]['venue_country'],
                                    softWrap: true,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: const Color(0xFFb0b1bc),
                                      fontSize: Dimensions.scaleH(15),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
