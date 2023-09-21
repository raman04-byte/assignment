import 'package:assignment/features/home/template/upperrowtemplate.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../constants/dimens.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'datatemplate.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({super.key});

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.scaleW(20),
        vertical: Dimensions.scaleH(20),
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [UpperRow(), CompleteData()],
        ),
      ),
    );
  }
}
