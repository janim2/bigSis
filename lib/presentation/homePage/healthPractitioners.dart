import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class HealthPractionersScreen extends StatefulWidget {
  const HealthPractionersScreen({Key? key}) : super(key: key);

  @override
  _HealthPractionersScreenState createState() =>
      _HealthPractionersScreenState();
}

class _HealthPractionersScreenState extends State<HealthPractionersScreen> {
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
                      Header(text: "HEALTH WORKERS")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Dr. Amo",
                        email: "Tech Hospital",
                        phone: "0243870474",
                        iswhite: false, //
                      ),
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Dr. Derrick Amoh",
                        email: "Ludicare Medical Services",
                        phone: "",
                        iswhite: false,
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
