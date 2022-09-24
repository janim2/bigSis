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

class GonorrheaScreen extends StatefulWidget {
  const GonorrheaScreen({Key? key}) : super(key: key);

  @override
  _GonorrheaScreenState createState() => _GonorrheaScreenState();
}

class _GonorrheaScreenState extends State<GonorrheaScreen> {
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
                      Header(text: "GONORRHEA")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      title("WHAT IS GONORRHEA"),
                      message(
                          "Gonorrhea, a bacterial infection, is also called “the clap” or “drip.” It’s a common sexually transmitted disease (STD). You can get gonorrhea by having sex with a person infected with it. A person can get gonorrhea after a rape."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHO GETS GONORRHEA?"),
                      message(
                          "Sexually active people of any age or gender can get gonorrhea. It spreads easily. Gonorrhea occurs most often in people who have many sex partners and those who don’t use condoms. You may not have any gonorrhea symptoms, so you can spread gonorrhea without knowing it."),
                      SizedBox(
                        height: 10,
                      ),
                      title("IS GONORRHEA CONTAGIOUS?"),
                      message(
                          "Gonorrhea is contagious and spreads easily during sexual activity.However, you can’t spread gonorrhea through casual touching, such as kissing or hugging. You also won’t spread it through sharing bathrooms or plates and cutlery."),
                      SizedBox(
                        height: 10,
                      ),
                      title("What are the gonorrhea symptoms in women?"),
                      message(
                          "Women may not have any gonorrhea symptoms. When symptoms are present, they may include:\n1. Unusual vaginal discharge (white or yellow).\n2. Pain in the lower abdomen or pelvis.\n3. Pain or burning when peeing.\n4. Bleeding between periods.\n5. Throat infection and pain (when infected due to oral sex)."),
                      SizedBox(
                        height: 10,
                      ),
                      title("What are symptoms of gonorrhea in men?"),
                      message(
                          "In men, symptoms include:\n1. White or yellow discharge from the penis.\n2. Pain or burning (possibly severe) when peeing.\n3. Throat infection and pain."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS GONORRHEA DIAGNOSED?"),
                      message(
                          "Your healthcare provider will ask you questions about your symptoms and sexual history. A urine test can often diagnose gonorrhea.During the physical exam, your provider may:\n1. Perform a pelvic exam, taking a sample of fluid from the cervix to test.\n2. Take a sample of fluid from the penis.\n3. Do a throat or anal culture to see if the infection is in those areas.\nYour provider will discuss which testing method is best in your situation. You may need to wait a few days for test results to come back from the lab. You may also have chlamydia, another STD.These two infections often occur together. Your provider may test you for both."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS GONORRHEA TREATED?"),
                      message(
                          "You’ll need antibiotics to treat gonorrhea. Your provider will tell you if you need the medicine via a shot or by mouth. IM Ceftriaxone and oral azithromycin are prescribed first. Make sure to take your medication as instructed, even if the symptoms improve and you start to feel better.Never take someone else’s medication to treat your illness. Doing so makes the infection harder to treat."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT ELSE SHOULD I DO IF I HAVE GONORRHEA?"),
                      message(
                          "To stay safe and keep your sex partner or partners safe, you should:\n1. Tell anyone you had sex with in the last three months that you have gonorrhea. It\’s important to do this because gonorrhea may not cause any symptoms. Women especially\nmay not have symptoms and won’t know to get tested and treated.\n2. Wait a week after you finish your medication before resuming your sex life.\n3. Use condoms and dental dams when you have sex.\n4. Get tested for HIV (AIDS) and other STDs (syphilis, herpes, chlamydia)."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW CAN I PREVENT GONORRHEA?"),
                      message(
                          "The only way to definitely avoid gonorrhea and other STDs is to not have sex (vaginal, oral or anal).If you are sexually active, you can take steps to protect yourself from gonorrhea:\n1. Don’t have sex with someone you know is infected.\n2. Always use a condom or dental dam during sex.\n3. In addition to a condom, use a spermicide containing nonoxynol-9.\n4. Limit sexual partners and get tested."),
                      SizedBox(
                        height: 10,
                      ),
                      title("CAN GONORRHEA BE CURED?"),
                      message(
                          "Untreated gonorrhea can cause several long-term health problems.\nIn women, untreated gonorrhea can:\n1. Spread to other reproductive organs, including the uterus and fallopian tubes, and cause pelvic inflammatory disease. PID can cause infertility and tubal pregnancies, which can be life-threatening to the mother and the baby.\n2. Cause eye problems in infants born to untreated mothers, leading to blindness.\n3. Spread to other parts of the body, causing swollen and painful joints, liver inflammation,and heart valve and brain damage.In men, untreated gonorrhea can cause:\n1. Scars in the urethra.\n2. Inflammation of the testicles.\n3. Infertility.\n4. Prostate pain and inflammation.\n5. Other problems if it spreads throughout the body, including swollen and painful joints, liver inflammation, and heart valve and brain damage."),
                      SizedBox(
                        height: 10,
                      ),
                      title("CAN I GET GONORRHEA AGAIN?"),
                      message(
                          "Yes. Repeat gonorrhea infections are common in people who don’t carefully protect themselves."),
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
