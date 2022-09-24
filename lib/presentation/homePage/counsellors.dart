import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class CounsellorsScreen extends StatefulWidget {
  const CounsellorsScreen({Key? key}) : super(key: key);

  @override
  _CounsellorsScreenState createState() => _CounsellorsScreenState();
}

class _CounsellorsScreenState extends State<CounsellorsScreen> {
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
                      Header(text: "COUNSELLORS")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Dr. Emmanuel Hopeson",
                        email: "Counsellor",
                        phone: "",
                        iswhite: true,
                      ),
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Mrs. Victoria De-Graft Adjei",
                        email: "Counsellor",
                        phone: "0244263984",
                        iswhite: true,
                      ),
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Mrs. Bernice S.O. Peasah",
                        email: "Counsellor",
                        phone: "0553394255",
                        iswhite: true,
                      ),
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Mr. Gilbert Konwie Langu",
                        email: "Counsellor",
                        phone: "0242005566",
                        iswhite: true,
                      ),
                      HealthWorkers(
                        image: "assets/images/userFemale.png",
                        drname: "Dr. Elizabeth A.S. Fordjour",
                        email: "Counsellor",
                        phone: "0207087380",
                        iswhite: true,
                      )
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
