import 'package:flutter/material.dart';

import '../core/app_export.dart';

class HealthWorkers extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String image;
  String drname;
  String email;
  bool iswhite;
  final ontap;

  // ignore: sort_constructors_first
  HealthWorkers(
      {required this.image,
      required this.drname,
      required this.email,
      required this.iswhite,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(5),
          width: size.width,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRect(child: Image.asset(image)),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drname,
                    style: TextStyle(
                        fontSize: 18,
                        color:
                            iswhite ? Colors.white : ColorConstant.defaultBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway"),
                  ),
                  Text(
                    email,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        color:
                            iswhite ? Colors.white : ColorConstant.defaultBlue,
                        fontFamily: "Raleway"),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(3),
                          width: 60,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: iswhite
                                ? Colors.white
                                : ColorConstant.defaultBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Call",
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Raleway",
                                fontSize: 12,
                                color: iswhite
                                    ? ColorConstant.defaultBlue
                                    : Colors.white,
                              ),
                            ),
                          ))),
                      Container(
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            color: iswhite
                                ? Colors.white
                                : ColorConstant.defaultBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Whatsapp",
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Raleway",
                                fontSize: 12,
                                color: iswhite
                                    ? ColorConstant.defaultBlue
                                    : Colors.white,
                              ),
                            ),
                          ))),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
