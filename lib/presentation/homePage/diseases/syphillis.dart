import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyphillisScreen extends StatefulWidget {
  const SyphillisScreen({Key? key}) : super(key: key);

  @override
  _SyphillisScreenState createState() => _SyphillisScreenState();
}

class _SyphillisScreenState extends State<SyphillisScreen> {
  title(String title) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: "Raleway",
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }

  message(String message) {
    return Text(
      message,
      style: TextStyle(
        fontFamily: "Raleway",
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image.asset(
          //   "assets/images/bg_3.jpg",
          //   height: size.height,
          //   width: size.width,
          //   fit: BoxFit.cover,
          // ),
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
                      Header(text: "SYPHILLIS")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      title("WHAT IS SYPHILIS?"),
                      message(
                          "Syphilis is a life-threatening sexually transmitted infection (STI). It spreads through sexual contact with someone who has the infection. Untreated syphilis can lead to death or serious health problems, including blindness, mental health disorders, and damage to the brain, heart, eyes and nervous system."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT ARE THE STAGES OF SYPHILIS?"),
                      message(
                          "If it isn’t treated, syphilis progresses in four stages. The infection causes different symptoms in each stage. In the first and second stages, people are very contagious and can easily pass the infection to their sex partners. The stages of syphilis are:\n1. Primary syphilis: The first stage happens two to 12 weeks after exposure to the bacteria. During this stage, a smooth, red sore called a chancre develops on the genitals or in the mouth. It goes away on its own in a few weeks or months. A chancre is small and usually painless, so you may not even know it’s there.\n2. Secondary syphilis: About one to six months after the chancre goes away, a rough, bumpy syphilis rash appears on the body, usually on your palms and soles (bottoms) of your feet. You may also have flu-like symptoms such as fever, fatigue, sore throat and muscle aches. These symptoms can come and go for months or years.\n3. Latent syphilis: If syphilis isn’t treated during the first two stages, the infection moves into the latent stage. Although there are no outward signs or symptoms of syphilis during this phase, the infection can damage your heart, bones, nerves and organs. This stage can last several years.\n4. Tertiary (late) syphilis: For many people, symptoms don’t progress past the latent phase, either because the infection cures itself or because symptoms are too mild to notice. About a third of people progress to the late syphilis phase, which causes a range of serious health problems. These problems occur slowly and include:\n- Brain damage, dementia and mental health problems.\n- Heart disease.\n- Movement disorders and muscle problems.\n- Nerve damage.\n- Seizures.\n- Tumors, usually on the bones and skin.\n-Vision problems.\nCongenital syphilis occurs when a pregnant woman passes the infection to her baby. Syphilis causes severe health problems in babies and children. It can be fatal. There has been a rise in congenital syphilis in the country and all pregnant women should be screened for syphilis."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHO MIGHT GET SYPHILIS?"),
                      message(
                          "Anyone who is sexually active can get syphilis, but some people have an increased risk of becoming infected. Your risk of syphilis is higher if you:\n1. Are gay, bisexual or a man who has sex with men (MSM).\n2. Have unprotected sex, especially if you have several partners.\n3. Are HIV positive.\n4. Have had sex with someone who has tested positive for syphilis.\n5. Tested positive for another STI, such as chlamydia, gonorrhea or herpes.\nA woman who is pregnant and has syphilis can pass the infection to her baby. Pregnant women should get tested for syphilis during pregnancy. The infection can cause death or severe health problems in babies and children."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT CAUSES SYPHILIS?"),
                      message(
                          "The bacteria Treponema pallidum causes syphilis. An infected person spreads the bacteria through vaginal, anal or oral sex. The bacteria enter the body through the anus, vagina, penis, mouth or broken skin. Syphilis is contagious. If you have syphilis and you have sex, you can infect your partner. If you are pregnant and have syphilis, you can give it to your unborn baby. But you can’t get syphilis by touching objects like toilet seats, utensils and doorknobs."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT ARE THE SYMPTOMS OF SYPHILIS?"),
                      message(
                          "Syphilis symptoms vary depending on the stage of the infection. In the first phase, a chancre (small,painless sore) develops on the genitals. During the second phase of syphilis, a pink, bumpy, roughrash appears on the body, usually on the palms of your hand or soles of your feet. You may also have flu-like symptoms such as fatigue, fever, sore throat and muscle aches.During the first and second stages of syphilis, you are very contagious. You can spread the infection if your partner comes into contact with the rash or chancre during sex."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS SYPHILIS DIAGNOSED?"),
                      message(
                          "Your healthcare provider will ask about your sexual history, including whether you practice safe sex. It’s important to be honest during this discussion. Your provider can help assess your risk and recommend tests for other STIs. To test for syphilis, your provider will examine you and take a sample of your blood to look for signs of the infection. Your provider may remove some fluid or a small piece of skin from a chance and test it in a lab. The only way to know for sure if you have syphilis is by visiting your healthcare provider and getting a lab test."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS SYPHILIS TREATED?"),
                      message(
                          "To treat syphilis, healthcare providers use antibiotics, usually penicillin. You must finish the entire course of antibiotics even if the chancre or rash goes away. It’s important to contact anyone you’ve had sex with in the last two years and let them know they should be tested.Your healthcare provider will test your blood after you finish a course of syphilis treatment to make sure the infection is gone. You can get syphilis again after you’ve been treated, so be sure to practice safe sex and get tested regularly if you have an increased risk of syphilis."),
                      SizedBox(
                        height: 10,
                      ),
                      title(
                          "CAN I GET SYPHILIS AGAIN AFTER I’VE BEEN TREATED?"),
                      message(
                          "If you’ve been treated for syphilis, you aren’t immune to it. You can get the infection again after treatment. That’s why it’s important to practice safe sex and get tested often if you have a high risk of infection."),
                      SizedBox(
                        height: 10,
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
