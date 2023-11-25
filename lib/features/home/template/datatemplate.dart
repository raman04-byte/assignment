import 'dart:convert';
import 'package:assignment/features/event_detail/screen/event_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/base_url.dart';
import '../../../constants/dimens.dart';
import '../../../model/event_model.dart';
import 'package:http/http.dart' as http;

class CompleteData extends StatefulWidget {
  const CompleteData({super.key});

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  String formatDateTime(String inputDateTime) {
    final dateTime = DateTime.parse(inputDateTime);
    final format = DateFormat("E, MMM d • h:mm a");
    final formattedDate = format.format(dateTime);
    return formattedDate;
  }

  List<Dataa> _data = [];

  Future<List<Dataa>> getData() async {
    try {
      final response = await http.get(
        Uri.parse('${BaseUrl.baseUrl}v1/event'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _data = data["content"]["data"]
            .map<Dataa>((json) => Dataa.fromJson(json))
            .toList();
        return _data;
      }
    } catch (e) {
      const snackbar = SnackBar(
        content: Text("Problem from our side or check your connection"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Error: $e");
    }
    return _data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.scaleH(30),
      ),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final eventData = snapshot.data;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final dateFormatted =
                    formatDateTime('${eventData?[index].dateTime}');
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetail(
                          id: '${eventData?[index].id}',
                        ),
                      ),
                    );
                  },
                  child: Card(
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
                            imageUrl: '${eventData?[index].bannerImage}',
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
                                  fontSize: Dimensions.scaleH(14),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.scaleH(2)),
                                child: Text(
                                  '${eventData?[index].venueName}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: Dimensions.scaleH(15),
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
                                      size: Dimensions.scaleH(12),
                                    ),
                                    Text(
                                      '${eventData?[index].venueCity}',
                                      softWrap: true,
                                      style: TextStyle(
                                        color: const Color(0xFFb0b1bc),
                                        fontSize: Dimensions.scaleH(12),
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
                                      '${eventData?[index].venueCountry}',
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: const Color(0xFFb0b1bc),
                                        fontSize: Dimensions.scaleH(12),
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
