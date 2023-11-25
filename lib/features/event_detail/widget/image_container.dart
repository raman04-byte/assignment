import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class ImageContainer extends StatefulWidget {
  final String image;
  const ImageContainer({super.key, required this.image});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
      height: Dimensions.scaleH(220),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.scaleW(10),
          right: Dimensions.scaleW(10),
          top: Dimensions.scaleH(20),
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: Dimensions.scaleH(25),
            ),
          ),
          title: Text(
            "Event Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.scaleH(25),
            ),
          ),
          trailing: Image.asset(
            Assets.favIcon,
            height: Dimensions.scaleH(60),
          ),
        ),
      ),
    );
  }
}
