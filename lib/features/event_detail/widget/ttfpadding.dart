import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class TTfPadding extends StatefulWidget {
  const TTfPadding({super.key});

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
        leading: Image.asset(
          Assets.tifIcon,
          height: Dimensions.scaleH(60),
        ),
        title: Text(
          "The Internet Folks",
          style: TextStyle(
            fontSize: Dimensions.scaleH(20),
          ),
        ),
        subtitle: Text(
          "Organizer",
          style: TextStyle(fontSize: Dimensions.scaleH(15)),
        ),
      ),
    );
  }
}
