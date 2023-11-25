import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class LocationComplete extends StatefulWidget {
  final String city;
  final String country;
  const LocationComplete(
      {super.key, required this.city, required this.country});

  @override
  State<LocationComplete> createState() => _LocationCompleteState();
}

class _LocationCompleteState extends State<LocationComplete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.scaleH(10),
      ),
      child: ListTile(
        leading: Image.asset(
          Assets.location,
          height: Dimensions.scaleH(60),
        ),
        title: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.scaleW(4),
          ),
          child: Text(
            widget.city,
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
            widget.country,
            style: TextStyle(fontSize: Dimensions.scaleH(15)),
          ),
        ),
      ),
    );
  }
}
