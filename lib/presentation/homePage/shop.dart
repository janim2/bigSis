import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

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
                      Container(
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
                                  'SHOP WITH US',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                  "Deals",
                                  style: TextStyle(
                                      fontFamily: "Raleway", fontSize: 20),
                                ))),
                          ),
                          Expanded(
                            flex: 1,
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
                                  "Pregnancy Package",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Raleway", fontSize: 20),
                                ))),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
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
                                  "Menstral Package",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Raleway", fontSize: 20),
                                ))),
                          ),
                          Expanded(
                            flex: 1,
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
                                  "Disinfectant Remedy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Raleway", fontSize: 20),
                                ))),
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
