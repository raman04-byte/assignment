import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/dimens.dart';

class UpperRow extends StatefulWidget {
  const UpperRow({super.key});

  @override
  State<UpperRow> createState() => _UpperRowState();
}

class _UpperRowState extends State<UpperRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Text(
                "Events",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.scaleH(20)),
              ),
              const Spacer(),
              Image.asset(
                Assets.searchIcon,
                height: 23,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.scaleW(10),
                ),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: Dimensions.scaleH(25),
                ),
              ),
            ],
          );
  }
}