import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.backImage), fit: BoxFit.cover),
      ),
      height: Dimensions.scaleH(220),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.scaleW(10),
          right: Dimensions.scaleW(10),
          top: Dimensions.scaleH(35),
        ),
        child: ListTile(
          leading: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: Dimensions.scaleH(25),
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
