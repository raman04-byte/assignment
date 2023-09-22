import 'package:assignment/features/event_detail/widget/button.dart';
import 'package:assignment/features/event_detail/widget/image_container.dart';
import 'package:assignment/features/event_detail/widget/location.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../constants/dimens.dart';
import '../widget/ttfpadding.dart';
import '../widget/date_time.dart';

class EventTemplate extends StatefulWidget {
  const EventTemplate({super.key});

  @override
  State<EventTemplate> createState() => _EventTemplateState();
}

class _EventTemplateState extends State<EventTemplate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ImageContainer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.scaleW(15),
              vertical: Dimensions.scaleH(20),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''International Band 
Music Concert''',
                  style: TextStyle(
                    fontSize: Dimensions.scaleH(40),
                  ),
                ),
                const TTfPadding(),
                const DateTime(),
                const LocationComplete(),
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
                    "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...",
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
