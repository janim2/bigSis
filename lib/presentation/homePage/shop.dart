import 'package:bigsis/presentation/homePage/cravings.dart';
import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/homePage/hygiene.dart';
import 'package:bigsis/presentation/homePage/sweet_peep.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

import 'hygiene_lounge.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/splash_bg.jpg",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            //backgroundColor: Colors.transparent,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Header(text: "SHOP WITH US")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SweetPeepScreen()));
                              },
                              child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.pink, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "Sweet Peep",
                                    style: TextStyle(
                                        fontFamily: "Raleway", fontSize: 20),
                                  ))),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        HygieneLoungeScreen()));
                              },
                              child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.pink, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "Hygiene",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Raleway", fontSize: 20),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CravingsScreen()));
                              },
                              child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.pink, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "Cravings Galore",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Raleway", fontSize: 20),
                                  ))),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HygieneScreen()));
                              },
                              child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.pink, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: Center(
                                      child: Text(
                                    "Hygiene Lounge",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Raleway", fontSize: 20),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
