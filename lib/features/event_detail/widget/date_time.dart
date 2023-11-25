import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class DateTimeWidget extends StatefulWidget {
  final String date;

  const DateTimeWidget({Key? key, required this.date}) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  String formatDateTime(String inputDateTime) {
    DateTime dateTime = DateTime.parse(inputDateTime);

    String formattedDate = DateFormat('d MMMM, y').format(dateTime);

    String formattedTime = DateFormat('EEEE, h:mma').format(dateTime);
    String formattedEndTime = DateFormat('h:mma').format(dateTime
        .add(const Duration(hours: 4))); 

    return '$formattedDate\n$formattedTime - $formattedEndTime';
  }

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = formatDateTime(widget.date);

    return ListTile(
      leading: Image.asset(
        Assets.date,
        height: Dimensions.scaleH(60),
      ),
      title: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.scaleW(4),
        ),
        child: Text(
          formattedDateTime.split('\n')[0], // Extracting the date part
          style: TextStyle(
            fontSize: Dimensions.scaleH(20),
          ),
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.scaleW(4),
          top: Dimensions.scaleH(4),
        ),
        child: Text(
          formattedDateTime.split('\n')[1], // Extracting the time part
          style: TextStyle(fontSize: Dimensions.scaleH(15)),
        ),
      ),
    );
  }
}
