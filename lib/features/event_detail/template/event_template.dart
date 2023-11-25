import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:assignment/features/event_detail/widget/button.dart';
import 'package:assignment/features/event_detail/widget/image_container.dart';
import 'package:assignment/features/event_detail/widget/location.dart';
import 'package:readmore/readmore.dart';
import '../../../constants/base_url.dart';
import '../../../constants/dimens.dart';
import '../widget/ttfpadding.dart';
import '../widget/date_time.dart';
import 'package:http/http.dart' as http;

class EventTemplate extends StatefulWidget {
  final String id;
  const EventTemplate({super.key, required this.id});

  @override
  State<EventTemplate> createState() => _EventTemplateState();
}

class _EventTemplateState extends State<EventTemplate> {
  String title = '';
  String description = '';
  String bannerImage = '';
  String dateTime = '';
  String organiserName = '';
  String organiserIcon = '';
  String venueName = '';
  String venueCity = '';
  String venueCountry = '';

  getData() async {
    try {
      final response = await http.get(
        Uri.parse('${BaseUrl.baseUrl}v1/event/${widget.id}'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        title = data["content"]["data"]["title"];
        description = data["content"]["data"]["description"];
        bannerImage = data["content"]["data"]["banner_image"];
        dateTime = data["content"]["data"]["date_time"];
        organiserName = data["content"]["data"]["organiser_name"];
        organiserIcon = data["content"]["data"]["organiser_icon"];
        venueName = data["content"]["data"]["venue_name"];
        venueCity = data["content"]["data"]["venue_city"];
        venueCountry = data["content"]["data"]["venue_country"];
        setState(() {});
      }
    } catch (e) {
      const snackbar = SnackBar(
        content: Text("Problem from our side or check your connection"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageContainer(
            image: bannerImage,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.scaleW(15),
              vertical: Dimensions.scaleH(20),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Dimensions.scaleH(40),
                  ),
                ),
                TTfPadding(
                  title: title,
                  organizer: organiserName,
                  organiserIcon: organiserIcon,
                ),
                DateTimeWidget(
                  date: dateTime,
                ),
                LocationComplete(
                  city: venueCity,
                  country: venueCountry,
                ),
                Padding(
                  padding: EdgeInsets.all(
                    Dimensions.scaleH(10),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Event",
                      style: TextStyle(
                        fontSize: Dimensions.scaleH(20),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.scaleW(10),
                    right: Dimensions.scaleW(10),
                  ),
                  child: ReadMoreText(
                    description,
                    style: TextStyle(fontSize: Dimensions.scaleH(17)),
                    // trimLines: 2,
                  ),
                ),
                const ContainerButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
