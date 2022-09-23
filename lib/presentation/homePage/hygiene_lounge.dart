import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HygieneLoungeScreen extends StatefulWidget {
  const HygieneLoungeScreen({Key? key}) : super(key: key);

  @override
  _HygieneLoungeScreenState createState() => _HygieneLoungeScreenState();
}

class _HygieneLoungeScreenState extends State<HygieneLoungeScreen> {
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
                      Header(text: "HYGIENE")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 3,
                              mainAxisCellCount: 2,
                              child: ImageCard(
                                image: "assets/images/hygiene_lounge/1.png",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/hygiene_lounge/1.png")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/hygiene_lounge/2.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset(
                                            "assets/images/hygiene_lounge/2.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/hygiene_lounge/3.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset(
                                            "assets/images/hygiene_lounge/3.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/hygiene_lounge/4.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset(
                                            "assets/images/hygiene_lounge/4.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2,
                            child: ImageCard(
                              image: "assets/images/hygiene_lounge/5.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset(
                                            "assets/images/hygiene_lounge/5.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2,
                            child: ImageCard(
                              image: "assets/images/hygiene_lounge/6.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset(
                                            "assets/images/hygiene_lounge/6.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
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
