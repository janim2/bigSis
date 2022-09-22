import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class ValleryScreen extends StatefulWidget {
  const ValleryScreen({Key? key}) : super(key: key);

  @override
  _ValleryScreenState createState() => _ValleryScreenState();
}

class _ValleryScreenState extends State<ValleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/homepage_bg.jpg",
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
                          color: ColorConstant.pink,
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
                                  'VALLERY',
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
                                child:
                                    Image.asset("assets/images/fun-facts.jpg")),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.asset(
                                    "assets/images/job-interview.png",
                                    fit: BoxFit.contain,
                                  ),
                                )),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.asset(
                                    "assets/images/emoji.png",
                                    fit: BoxFit.contain,
                                  ),
                                )),
                          ),
                          // Expanded(
                          //     flex: 1,
                          //     child: VideoCard(
                          //       image: "",
                          //     )),
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
