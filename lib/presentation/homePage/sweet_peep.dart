import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SweetPeepScreen extends StatefulWidget {
  const SweetPeepScreen({Key? key}) : super(key: key);

  @override
  _SweetPeepScreenState createState() => _SweetPeepScreenState();
}

class _SweetPeepScreenState extends State<SweetPeepScreen> {
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
                      Header(text: 'SWEET PEEP')
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
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: ImageCard(
                                image: "assets/images/sweetpeep/1.jpg",
                                ontap: () {
                                  showImageViewer(
                                      context,
                                      Image.asset(
                                              "assets/images/sweetpeep/1.jpg")
                                          .image,
                                      swipeDismissible: false);
                                },
                              )),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/2.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/2.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/3.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/3.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 3,
                            mainAxisCellCount: 2,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/4.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/4.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/5.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/5.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/6.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/6.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/7.jpg",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/7.jpg")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/8.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/8.png")
                                        .image,
                                    swipeDismissible: false);
                              },
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 2,
                            child: ImageCard(
                              image: "assets/images/sweetpeep/9.png",
                              ontap: () {
                                showImageViewer(
                                    context,
                                    Image.asset("assets/images/sweetpeep/9.png")
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
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Expanded(
                      //         flex: 1,
                      //         child: ImageCard(
                      //           image: "assets/images/loggia/gonorhhea.jpg",
                      //           ontap: () {
                      //             showImageViewer(
                      //                 context,
                      //                 Image.asset(
                      //                         "assets/images/loggia/gonorhhea.jpg")
                      //                     .image,
                      //                 swipeDismissible: false);
                      //           },
                      //         )),
                      //     Expanded(
                      //         flex: 1,
                      //         child: ImageCard(
                      //           image: "assets/images/loggia/herpies.jpg",
                      //           ontap: () {
                      //             showImageViewer(
                      //                 context,
                      //                 Image.asset(
                      //                         "assets/images/loggia/herpies.jpg")
                      //                     .image,
                      //                 swipeDismissible: false);
                      //           },
                      //         )),
                      //   ],
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Expanded(
                      //         flex: 1,
                      //         child: ImageCard(
                      //           image: "assets/images/loggia/herpesType2.jpg",
                      //           ontap: () {
                      //             showImageViewer(
                      //                 context,
                      //                 Image.asset(
                      //                         "assets/images/loggia/herpesType2.jpg")
                      //                     .image,
                      //                 swipeDismissible: false);
                      //           },
                      //         )),
                      //     Expanded(
                      //         flex: 1,
                      //         child: ImageCard(
                      //           image: "assets/images/loggia/sYPHILLIS.jpg",
                      //           ontap: () {
                      //             showImageViewer(
                      //                 context,
                      //                 Image.asset(
                      //                         "assets/images/loggia/sYPHILLIS.jpg")
                      //                     .image,
                      //                 swipeDismissible: false);
                      //           },
                      //         )),
                      //   ],
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Expanded(
                      //         flex: 1,
                      //         child: ImageCard(
                      //           image: "assets/images/loggia/sYPHLISS.jpg",
                      //           ontap: () {
                      //             showImageViewer(
                      //                 context,
                      //                 Image.asset(
                      //                         "assets/images/loggia/sYPHLISS.jpg")
                      //                     .image,
                      //                 swipeDismissible: false);
                      //           },
                      //         )),
                      //     // Expanded(
                      //     //     flex: 1,
                      //     //     child: ImageCard(
                      //     //       image: "assets/images/no_image.png",
                      //     //     )),
                      //   ],
                      // ),
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
