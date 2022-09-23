import 'package:flutter/material.dart';

import '../core/app_export.dart';

class Header extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String text;
  final ontap;

  // ignore: sort_constructors_first
  Header({required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 20, right: 20),
        width: 275,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink, width: 2.0),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.pink,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
