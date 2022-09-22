import 'package:flutter/material.dart';

import '../core/app_export.dart';

class PinkCircularButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  final ontap;

  // ignore: sort_constructors_first
  PinkCircularButton({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ColorConstant.pink, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              textonButton,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Raleway", fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
