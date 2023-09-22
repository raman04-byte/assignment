import 'dart:convert';

import 'package:assignment/constants/assets.dart';
import 'package:assignment/features/search/widget/searchtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../constants/dimens.dart';

class SearchTemplate extends StatefulWidget {
  const SearchTemplate({super.key});

  @override
  State<SearchTemplate> createState() => _SearchTemplateState();
}

class _SearchTemplateState extends State<SearchTemplate> {
  final TextEditingController _controller = TextEditingController();
  List _items = [];
  List _queryResult = [];
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

  void filterSearchResult(String query) {
    setState(() {
      _queryResult = _items
          .where((element) =>
              element["venue_name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.scaleW(20),
          vertical: Dimensions.scaleH(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTile(),
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      hintText: "Type Event Name",
                      onChanged: (value) {
                        setState(() {
                          _controller.text = value;
                          filterSearchResult(value);
                        });
                      },
                      leading: Image.asset(
                        Assets.searchIconBlue,
                        height: Dimensions.scaleH(25),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
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
                        itemCount: _queryResult.length,
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
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(width: Dimensions.scaleW(15)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.scaleH(20)),
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
              )
            ],
          ),
        ));
  }
}
