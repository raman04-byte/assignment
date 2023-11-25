import 'dart:convert';
import 'package:assignment/constants/assets.dart';
import 'package:assignment/features/search/widget/searchtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../constants/base_url.dart';
import '../../../constants/dimens.dart';
import '../../../model/event_model.dart';

class SearchTemplate extends StatefulWidget {
  const SearchTemplate({super.key});

  @override
  State<SearchTemplate> createState() => _SearchTemplateState();
}

class _SearchTemplateState extends State<SearchTemplate> {
  final TextEditingController _controller = TextEditingController();
  List _queryResult = [];
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

  String formatDateTime(String inputDateTime) {
    final dateTime = DateTime.parse(inputDateTime);
    final format = DateFormat("E, MMM d • h:mm a");
    final formattedDate = format.format(dateTime);
    return formattedDate;
  }

  void filterSearchResult(String query) {
    setState(() {
      _queryResult = _data
          .where((element) =>
              element.venueName!.toLowerCase().contains(query.toLowerCase()))
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
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final eventData = snapshot.data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _queryResult.length,
                        itemBuilder: (context, index) {
                          final dateFormatted =
                              formatDateTime('${eventData?[index].dateTime}');
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
                                    imageUrl: '${eventData?[index].bannerImage}',
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
                                          '${eventData?[index].venueName}',
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
