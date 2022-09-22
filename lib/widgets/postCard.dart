import 'package:flutter/material.dart';

import '../core/app_export.dart';

class PostCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String userProfile;
  String title;
  String postImage;
  final ontap;

  // ignore: sort_constructors_first
  PostCard(
      {required this.userProfile,
      required this.title,
      required this.postImage,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.only(bottom: 10, top: 10, right: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2.0),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      userProfile,
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                height: 200,
                child: Image.asset(
                  postImage,
                  fit: BoxFit.contain,
                ),
              )
            ],
          )),
    );
  }
}
