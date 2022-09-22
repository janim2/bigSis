import 'package:flutter/material.dart';

import '../core/app_export.dart';

class DefaultButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String text;
  final ontap;

  // ignore: sort_constructors_first
  DefaultButton({required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(5),
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 40,
                color: ColorConstant.defaultBlue),
          ))),
    );
  }
}
