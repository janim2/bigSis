import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

import '../../widgets/header.dart';

class PicturesScreen extends StatefulWidget {
  const PicturesScreen({Key? key}) : super(key: key);

  @override
  _PicturesScreenState createState() => _PicturesScreenState();
}

class _PicturesScreenState extends State<PicturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg_2.jpg",
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
                      Header(text: "PICTURES"),
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
                              child: ImageCard(
                                image: "assets/images/loggia/gonorhhea.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/loggia/gonorhhea.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                          Expanded(
                              flex: 1,
                              child: ImageCard(
                                image: "assets/images/loggia/herpies.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/loggia/herpies.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: ImageCard(
                                image: "assets/images/loggia/herpesType2.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/loggia/herpesType2.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                          Expanded(
                              flex: 1,
                              child: ImageCard(
                                image: "assets/images/loggia/sYPHILLIS.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/loggia/sYPHILLIS.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: ImageCard(
                                image: "assets/images/loggia/sYPHLISS.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/loggia/sYPHLISS.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                          // Expanded(
                          //     flex: 1,
                          //     child: ImageCard(
                          //       image: "assets/images/no_image.png",
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
