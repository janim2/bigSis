import 'package:bigsis/core/app_export.dart';
import 'package:bigsis/presentation/homePage/about.dart';
import 'package:bigsis/presentation/homePage/chatroom.dart';
import 'package:bigsis/presentation/homePage/comments.dart';
import 'package:bigsis/presentation/homePage/counsellors.dart';
import 'package:bigsis/presentation/homePage/healthPractitioners.dart';
import 'package:bigsis/presentation/homePage/pictures.dart';
import 'package:bigsis/presentation/homePage/profile.dart';
import 'package:bigsis/presentation/homePage/report.dart';
import 'package:bigsis/presentation/homePage/shop.dart';
import 'package:bigsis/presentation/homePage/vallery.dart';
import 'package:bigsis/presentation/homePage/videos.dart';
import 'package:bigsis/presentation/homePage/volunteer.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/informationCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/auth/logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? diagnosis; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  String? film; //no radio button will be selected
  //String gender = "male"; //if you want to set default value

  var scaffoldKey = GlobalKey<ScaffoldState>();
  String name = "";
  String email = "";

  @override
  initState() {
    FetchFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                    ),
                    Image(
                      image: AssetImage('assets/images/userFemale.png'),
                      height: 100,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style: TextStyle(fontFamily: "Raleway", fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      email,
                      style: TextStyle(fontFamily: "Raleway", fontSize: 16),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle_sharp,
                    color: ColorConstant.pink),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              // Divider(
              //   thickness: 3,
              // ),
              // ListTile(
              //   leading:
              //       Icon(Icons.art_track_outlined, color: ColorConstant.pink),
              //   title: const Text(
              //     'Comments',
              //     style: TextStyle(fontFamily: "Raleway", fontSize: 20),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => CommentsScreen()));
              //   },
              // ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket_outlined,
                    color: ColorConstant.pink),
                title: const Text(
                  'Shop',
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ShopScreen()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.text_snippet, color: ColorConstant.pink),
                title: const Text(
                  'About',
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  'Logout',
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20),
                ),
                onTap: () {
                  showTwoButtonAlertDialog(context, "Logout",
                      "Are you sure you want to logout?", "Stay", "Logout", () {
                    Navigator.of(context).pop();
                  }, () {
                    Logout(context);
                  });
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // home page
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/homepage_bg.jpg",
                    alignment: Alignment.topLeft,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: BottomAppBar(
                      elevation: 100,
                      color: Colors.transparent,
                      child: TabBar(
                        indicatorColor: Colors.pink,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.home,
                              color: ColorConstant.pink,
                              size: 40,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage('assets/images/book.png'),
                            ),
                          ),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/loggia.png'),
                          )),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/plaza.png'),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Image(
                                        image: AssetImage(
                                            'assets/images/menu.png')),
                                    onPressed: () =>
                                        scaffoldKey.currentState?.openDrawer(),
                                  ),
                                  SizedBox(
                                      width: 270,
                                      child: PinkCircularButton(
                                          textonButton: 'HOME')),
                                ],
                              ),
                              Container(
                                width: size.width,
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'WELCOME',
                                          style: TextStyle(
                                              color: ColorConstant.pink,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40),
                                        ),
                                        Image(
                                          image: AssetImage(
                                              'assets/images/userFemale.png'),
                                          height: 70,
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(name,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontFamily: "Raleway",
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              Container(
                                width: size.width,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: ColorConstant.pink,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(
                                    '"We live in an imbalanced society when it comes to encouraging male sexuality and discouraging female sexuality."',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Raleway"),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width,
                                margin: EdgeInsets.all(30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReportScreen()));
                                  },
                                  child: Text(
                                    'Talk to me.\n Any problem down there?',
                                    style: TextStyle(
                                        color: ColorConstant.pink,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Raleway"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //book page
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/homepage_bg.jpg",
                    alignment: Alignment.topLeft,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: BottomAppBar(
                      elevation: 100,
                      color: Colors.transparent,
                      child: TabBar(
                        indicatorColor: Colors.pink,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.home,
                              color: ColorConstant.pink,
                              size: 40,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage('assets/images/book.png'),
                            ),
                          ),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/loggia.png'),
                          )),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/plaza.png'),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),

                ///BOOK VELVET STARTS HERE
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Image(
                                          image: AssetImage(
                                              'assets/images/menu.png')),
                                      onPressed: () => scaffoldKey.currentState
                                          ?.openDrawer(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 20, top: 20, right: 20),
                                      width: 275,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.pink, width: 2.0),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'BOOK VELVET',
                                                style: TextStyle(
                                                    color: ColorConstant.pink,
                                                    fontFamily: "Raleway",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/book.png'),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                color: Colors.black,
                                width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'ADVERTISMENT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: "Raleway"),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'WHAT WILL YOU LIKE TO KNOW',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'About your sexual health',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Raleway",
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InformationCard(textonButton: ""),
                              SizedBox(
                                height: 20,
                              ),
                              InformationCard(textonButton: ""),
                              SizedBox(
                                height: 20,
                              ),
                              InformationCard(textonButton: ""),
                              SizedBox(
                                height: 20,
                              ),
                              InformationCard(textonButton: ""),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, top: 30),
                                  child: Text(
                                    "For more Info",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Raleway",
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //BOOK VELVET PAGE ENDS HERE
            //LOGGIA PAGE STARTS HERE
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/homepage_bg.jpg",
                    alignment: Alignment.topLeft,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: BottomAppBar(
                      elevation: 100,
                      color: Colors.transparent,
                      child: TabBar(
                        indicatorColor: Colors.pink,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.home,
                              color: ColorConstant.pink,
                              size: 40,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage('assets/images/book.png'),
                            ),
                          ),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/loggia.png'),
                          )),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/plaza.png'),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Image(
                                          image: AssetImage(
                                              'assets/images/menu.png')),
                                      onPressed: () => scaffoldKey.currentState
                                          ?.openDrawer(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 20, top: 20, right: 20),
                                      width: 275,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.pink, width: 2.0),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'LOGGIA',
                                                style: TextStyle(
                                                    color: Colors.pink,
                                                    fontFamily: "Raleway",
                                                    fontSize: 30),
                                              ),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/loggia.png'),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                  height: 130,
                                  child: InformationCard(
                                    textonButton: "Pictures",
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PicturesScreen()));
                                    },
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 130,
                                  child: InformationCard(
                                    textonButton: "Videos",
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VideosScreen()));
                                    },
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 130,
                                  child: InformationCard(
                                    textonButton: "Vallery",
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ValleryScreen()));
                                    },
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //LOGIA ENDS HERE
            //PLAZA STARTS HERE
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/homepage_bg.jpg",
                    alignment: Alignment.topLeft,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: BottomAppBar(
                      elevation: 100,
                      color: Colors.transparent,
                      child: TabBar(
                        indicatorColor: Colors.pink,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.home,
                              color: ColorConstant.pink,
                              size: 40,
                            ),
                          ),
                          Tab(
                            icon: Image(
                              image: AssetImage('assets/images/book.png'),
                            ),
                          ),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/loggia.png'),
                          )),
                          Tab(
                              icon: Image(
                            image: AssetImage('assets/images/plaza.png'),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                //LOGIA ENDS HERE
                //PLAZA STARTS HERE
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Image(
                                          image: AssetImage(
                                              'assets/images/menu.png')),
                                      onPressed: () => scaffoldKey.currentState
                                          ?.openDrawer(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 20, top: 20, right: 20),
                                      width: 275,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.pink, width: 2.0),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                'PLAZA',
                                                style: TextStyle(
                                                    color: Colors.pink,
                                                    fontFamily: "Raleway",
                                                    fontSize: 30),
                                              ),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/plaza.png'),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                color: Colors.black,
                                width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      'ADVERTISMENT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Raleway",
                                          fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                child: InformationCard(
                                    textonButton: "Health Practioners",
                                    ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HealthPractionersScreen()));
                                    }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 60,
                                child: InformationCard(
                                  textonButton: "Counsellors",
                                  ontap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CounsellorsScreen()));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 105),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CommentsScreen()));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        "Chatroom",
                                        style: TextStyle(
                                            fontFamily: "Raleway",
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 105),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VolunteerScreen()));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        "Volunteer",
                                        style: TextStyle(
                                            fontFamily: "Raleway",
                                            fontSize: 30,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FetchFromSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("fullname")!;
      email = pref.getString("email")!;
    });
  }
}
