import 'dart:async';
import 'dart:io';

import 'package:bigsis/core/app_export.dart';
import 'package:bigsis/presentation/homePage/about.dart';
import 'package:bigsis/presentation/homePage/chatroom.dart';
import 'package:bigsis/presentation/homePage/comments.dart';
import 'package:bigsis/presentation/homePage/counsellors.dart';
import 'package:bigsis/presentation/homePage/diseases/chlamydia.dart';
import 'package:bigsis/presentation/homePage/diseases/gonorrhea.dart';
import 'package:bigsis/presentation/homePage/diseases/herpes.dart';
import 'package:bigsis/presentation/homePage/diseases/syphillis.dart';
import 'package:bigsis/presentation/homePage/diseases/urinary_tract_infection.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/auth/logout.dart';
import '../../core/helpers/functions.dart';

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
  List<String> quotes = [
    'Ask any woman and she\'ll tell you: health care for women is more expensive than it is for men. In fact, during their reproductive years, women spend 68% more on health care than men do.\n\n-Rod Blagojevich',
    'Every human being is the author of his own health or disease.\n\n-Gautama Buddha',
    'Women sexual health deserves the same attention as men\'s does.\n\n-Anonymous',
    'No woman can call herself free who does not control her own body.\n\n-Margaret Sanger',
    'Our lives begin to end the next day we become silent about things that matter.\n\n-Martin Luther King Jr.',
    'Don’t put off till tomorrow anything you could be doing today.\n\nEmma Chase',
    'If a woman loves her own body, she doesn’t grudge what  other women do with theirs; if she loves femaleness she champions its rights.\n\nNaomi Wolf',
    'I’m interested in women’s health care because I’m a woman. I’d be a darn fool not to be on my own side.\n\n-Maya Anjelou',
    'Being a healthy woman isn’t about getting on a scale or measuring your waistline. We need to start focusing on what matters, on how we feel, and how we feel about ourselves.\n\n-Michelle Obama',
    'Women’s health needs to be front and center. It often isn’t,  but it needs to be.\n\n-Cynthia Nixon',
    'A woman’s health is her capital.\n\n-Harriet Beecher Stowe',
    'If you check the health of a woman, you check the health of society.\n\n-Rebecca Milner',
    'At the end of the day,  your health is your responsibility.\n\n-Anonymous',
    'Ama: If you want to see a man’s true colours, get pregnant for him.\nYaa: Because of colour I should get pregnant.',
    'Patient: “Doctor, doctor, I think I am losing my memory!”\nDoctor: “When did that happen?”\nPatient: “When did what happen?”',
    'Why is a doctor always calm?\nThey have a lot of patients.',
    'Doctor: “I have some bad news and some very bad news.”\nPatient: “Well, might as well give me the bad news first.”\nDoctor: “The lab called with your test results. They said you have 24 hours to live.”\nPatient: “24 HOURS! That’s terrible!! What could be worse? What’s the very bad news?”\nDoctor: “I’ve been trying to reach you since yesterday.”',
    'When I told the doctor about my loss of memory, he made me pay in advance.',
    'Patient: “Doctor, are the test results ready yet? I’m dying of curiosity!”\nDoctor: “Heh… not only from curiosity.”',
    'Patient: “Someone decided to graffiti my house last night!”\nDoctor: “So why are you telling me?”\nPatient: “I can’t understand the writing. Was it you?”',
    'My dermatologist was fired today.\nI’m told he made too many rash decisions.'
  ];

  String thequote = "";

  String remotePDFpath = "";

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
                // Positioned.fill(
                //   child: Image.asset(
                //     "assets/images/homepage_bg.jpg",
                //     alignment: Alignment.topLeft,
                //   ),
                // ),
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
                      color: Colors.white,
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
                                      width: 260,
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
                                              fontSize: 30),
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
                                            fontSize: 23,
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
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        thequote,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "Raleway"),
                                      ),
                                      // Align(
                                      //   alignment: Alignment.centerRight,
                                      //   child: Text(
                                      //     "- $thewriter",
                                      //     style: TextStyle(
                                      //         color: Colors.white,
                                      //         fontSize: 20,
                                      //         fontFamily: "Raleway"),
                                      //   ),
                                      // ),
                                    ],
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
                                        fontSize: 20,
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
                // Positioned.fill(
                //   child: Image.asset(
                //     "assets/images/homepage_bg.jpg",
                //     alignment: Alignment.topLeft,
                //   ),
                // ),
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
                                      width: 235,
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
                                                    fontSize: 23),
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
                                height: size.height - 300,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
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
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    // PdfView(path: 'assets/pdf/CHLAMYDIA.pdf'),
                                    InformationCard(
                                        textonButton: "Chlamydia",
                                        ontap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChlamydiaScreen(),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InformationCard(
                                        textonButton: "Genital Herpes",
                                        ontap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HerpesScreen(),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InformationCard(
                                        textonButton: "Gonorrhea",
                                        ontap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GonorrheaScreen(),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InformationCard(
                                        textonButton: "Syphillis",
                                        ontap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SyphillisScreen(),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InformationCard(
                                        textonButton: "Urinary Tract Infection",
                                        ontap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UrinaryTractScreen(),
                                            ),
                                          );
                                        }),
                                    GestureDetector(
                                      onTap: () {
                                        showToast("No information yet");
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, top: 30),
                                          child: Text(
                                            "For more Info",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Raleway",
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
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
            //BOOK VELVET PAGE ENDS HERE
            //LOGGIA PAGE STARTS HERE
            Stack(
              children: [
                // Positioned.fill(
                //   child: Image.asset(
                //     "assets/images/homepage_bg.jpg",
                //     alignment: Alignment.topLeft,
                //   ),
                // ),
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
                                      width: 235,
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
                                                    fontSize: 23),
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
                // Positioned.fill(
                //   child: Image.asset(
                //     "assets/images/homepage_bg.jpg",
                //     alignment: Alignment.topLeft,
                //   ),
                // ),
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
                                      width: 235,
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
                                            fontSize: 25,
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
                                            fontSize: 25,
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
      thequote = (quotes.toSet().toList()..shuffle()).take(1).toList()[0];
    });
  }
}
