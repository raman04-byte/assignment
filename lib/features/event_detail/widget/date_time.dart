import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class DateTime extends StatefulWidget {
  const DateTime({super.key});

  @override
  State<DateTime> createState() => _DateTimeState();
}

class _DateTimeState extends State<DateTime> {
  @override
  Widget build(BuildContext context) {
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
          "14 December, 2021",
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
          "Tuesday, 4:00PM - 9:00PM",
          style: TextStyle(fontSize: Dimensions.scaleH(15)),
        ),
      ),
    );
  }
}
