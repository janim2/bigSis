import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CommentsCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String name;
  String message;
  String date;
  final ontap;

  // ignore: sort_constructors_first
  CommentsCard(
      {required this.name,
      required this.message,
      required this.date,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 10, top: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2.0),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                  style: TextStyle(fontFamily: "Raleway", fontSize: 16),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  date,
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          )),
    );
  }
}
