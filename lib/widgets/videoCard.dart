import 'package:flutter/material.dart';

import '../core/app_export.dart';

class VideoCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  final ontap;

  // ignore: sort_constructors_first
  VideoCard({required this.image, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 130,
          margin: EdgeInsets.only(bottom: 10, top: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2.0),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white),
          child: Icon(
            Icons.video_collection,
            size: 30,
            color: ColorConstant.pink,
          )),
    );
  }
}
