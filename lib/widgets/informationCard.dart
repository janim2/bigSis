import 'package:flutter/material.dart';

import '../core/app_export.dart';

class InformationCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  final ontap;

  // ignore: sort_constructors_first
  InformationCard({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              textonButton,
              style: TextStyle(
                  fontFamily: "Raleway", fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
