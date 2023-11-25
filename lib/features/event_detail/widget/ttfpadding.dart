import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';

class TTfPadding extends StatefulWidget {
  final String title;
  final String organizer;
  final String organiserIcon;
  const TTfPadding(
      {super.key,
      required this.title,
      required this.organizer,
      required this.organiserIcon});

  @override
  State<TTfPadding> createState() => _TTfPaddingState();
}

class _TTfPaddingState extends State<TTfPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.scaleH(10),
      ),
      child: ListTile(
        leading: CachedNetworkImage(
          height: Dimensions.scaleH(80),
          width: Dimensions.scaleW(60),
          imageUrl: widget.organiserIcon,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: Dimensions.scaleH(20),
          ),
        ),
        subtitle: Text(
          widget.organizer,
          style: TextStyle(fontSize: Dimensions.scaleH(15)),
        ),
      ),
    );
  }
}
