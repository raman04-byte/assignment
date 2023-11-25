import 'package:assignment/routing/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/dimens.dart';

class ContainerButton extends StatefulWidget {
  const ContainerButton({super.key});

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF5669ff),
      ),
      height: Dimensions.scaleH(80),
      width: Dimensions.scaleW(270),
      alignment: Alignment.center,
      child: ListTile(
        onTap: () {
          Get.toNamed(NamesRoutes.search);
        },
        title: Text(
          'Book Now',
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.scaleH(20),
          ),
        ),
        trailing: CircleAvatar(
          backgroundColor: const Color(0xFF3d56f0),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: Dimensions.scaleH(20),
          ),
        ),
      ),
    );
  }
}