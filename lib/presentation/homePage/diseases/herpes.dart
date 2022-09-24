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

class HerpesScreen extends StatefulWidget {
  const HerpesScreen({Key? key}) : super(key: key);

  @override
  _HerpesScreenState createState() => _HerpesScreenState();
}

class _HerpesScreenState extends State<HerpesScreen> {
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
                      Header(text: "GENITAL HERPES")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      title("WHAT IS GENITAL HERPES"),
                      message(
                          "Genital herpes is a common sexually transmitted infection caused by the herpes simplex virus (HSV). Sexual contact is the primary way that the virus spreads. After the initial infection, the virus lies dormant in your body and can reactivate several times a year.Genital herpes can cause pain, itching and sores in your genital area. But you may have no signs or symptoms of genital herpes. If infected, you can be contagious even if you have no visible sores.There is no cure for genital herpes, but medications can ease symptoms and reduce the risk of infecting others. Condoms also can help prevent the spread of a genital herpes infection."),
                      SizedBox(
                        height: 10,
                      ),
                      title("PEOPLE MAY GET GENITAL HERPES THROUGH"),
                      message(
                          "1. Intercourse, including anal, vaginal-penile and vaginal-vaginal.\n2. Oral sex (giving or receiving) with someone who’s infected.\n3. Skin-to-skin contact without ejaculation.\n4. Touching open sores, including while breastfeeding.\n5. Childbirth by a mother or gestational parent who has an active infection.\nYou can’t get genital herpes from objects like toilet seats. But you could pass genital herpes through shared sex toys. (To stay safe, wash sex toys before and after using them, and don’t share them. If you do, protect them with a condom.)"),
                      SizedBox(
                        height: 10,
                      ),
                      title("SYMPTOMS OF GENITAL HERPES"),
                      message(
                          "Most people infected with HSV don't know they have it because they don't have any signs or symptoms or because their signs and symptoms are so mild.When present, symptoms may begin about two to 12 days after exposure to the virus. If you experience symptoms of genital herpes, they may include:\n1. Pain or itching. You may experience pain and tenderness in your genital area until the infection clears.\n2. Small red bumps or tiny white blisters. These may appear a few days to a few weeks after infection.\n3. Ulcers. These may form when blisters rupture and ooze or bleed. Ulcers may make it painful to urinate.\n4. Scabs. Skin will crust over and form scabs as ulcers heal."),
                      SizedBox(
                        height: 10,
                      ),
                      title("COMPLICATIONS"),
                      message(
                          "Complications associated with genital herpes may include:\n1. Other sexually transmitted infections. Having genital sores increases your risk of transmitting or contracting other sexually transmitted infections, including AIDS.\n2 Newborn infection. Babies born to infected mothers can be exposed to the virus during the birthing process. This may result in brain damage, blindness or death for the newborn.\n3. Bladder problems. In some cases, the sores associated with genital herpes can cause inflammation around the tube that delivers urine from your bladder to the outside world(urethra). The swelling can close the urethra for several days, requiring the insertion of a catheter to drain your bladder.\n4. Meningitis. In rare instances, HSV infection leads to inflammation of the membranes and cerebrospinal fluid surrounding your brain and spinal cord.\n5. Rectal inflammation (proctitis). Genital herpes can lead to inflammation of the lining of the rectum, particularly in men who have sex with men."),
                      SizedBox(
                        height: 10,
                      ),
                      title("PREVENTING GENITAL HERPES"),
                      message(
                          "If you’re sexually active, you can take these steps to protect yourself and others from the herpes virus and other STIs:\n1. Be monogamous with one sexual partner or limit your number of partners.\n2. Get tested for STIs and complete any prescribed treatment.\n3. Tell your sexual partners if you have genital herpes so they can get tested.\n4. Use condoms during intercourse and dental dams during oral sex.\nWash your hands often if you have an outbreak or are around someone with symptoms.If your sexual partner has genital herpes, these actions can lower your risk of getting the virus:\n1. Don’t have sex when your partner has active symptoms. Condoms may not cover all sores,so you may still get the virus.\n2. Make sure your partner takes antiviral medication as prescribed.\n3. Wait to have sex until scabs fall off active lesions.\n4. Avoid intercourse if either partner has an outbreak of herpes in the genital area or anywhere else"),
                      SizedBox(
                        height: 10,
                      ),
                      title(
                          "HOW CAN I EASE MY SYMPTOMS DURING AN OUTBREAK OF GENITAL HERPES??"),
                      message(
                          "1. Apply an ice pack to your genitals. Wrap the ice pack in a washcloth or apply it over yourunderwear.\n2. Keep your genitals dry. Wear cotton or other non-synthetic underpants and avoid tight-fitting clothes. Moist sores take longer to heal.\n3. Soak in a warm bath.\n4. .Take nonsteroidal anti-inflammatory drugs (NSAIDs) to relieve pain.\n5. Topical 1\% or 2\% lidocaine may be used as a topical analgesic."),
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
