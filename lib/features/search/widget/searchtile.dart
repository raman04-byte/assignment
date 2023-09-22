import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';

class SearchTile extends StatefulWidget {
  const SearchTile({super.key});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.keyboard_backspace_rounded,
        color: Colors.black,
      ),
      title: Text(
        "Search",
        style: TextStyle(fontSize: Dimensions.scaleH(24)),
      ),
    );
  }
}
