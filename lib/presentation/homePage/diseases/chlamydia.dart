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

class ChlamydiaScreen extends StatefulWidget {
  const ChlamydiaScreen({Key? key}) : super(key: key);

  @override
  _ChlamydiaScreenState createState() => _ChlamydiaScreenState();
}

class _ChlamydiaScreenState extends State<ChlamydiaScreen> {
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
                      Header(text: "CHLAMYDIA")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      title("WHAT IS CHLAMYDIA"),
                      message(
                        "Chlamydia is a common sexually transmitted infection (STI) that’s caused by a bacteria called chlamydia trachomatis (C. trachomatis). Once a person's infected, they can spread chlamydia to their partners through intercourse, anal sex or oral sex. Infections can also occur when partners share sex toys that have become contaminated with the bacteria responsible for chlamydia. Chlamydia infections are treatable and curable. But it’s important to receive treatment as soon as possible. Left untreated, chlamydia can lead to serious complications.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHO DOES CHLAMYDIA AFFECT?"),
                      message(
                        "Anyone who’s sexually active can get chlamydia. The bacteria that cause chlamydia gets transmitted through vaginal fluid and semen, which means that people of all genders who have sex can become infected with chlamydia and infect their partners, too. If you’re pregnant and have chlamydia, you can pass it on to your newborn.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT CAUSES CHLAMYDIA?"),
                      message(
                        "Chlamydia infections spread through sexual contact, when vaginal fluid or semen containing the bacteria that causes chlamydia travels from one person to another. Sexual contact includes all kinds of sex, including sex that doesn’t involve penetration or ejaculation. There are lots of ways that the fluids from one person’s genitals can transmit the bacteria that causes chlamydia.\n1. Intercourse. Bacteria pass from one person’s penis to their partner’s vagina or vice versa.\n2. Anal sex. Bacteria passes from one person’s penis to their partner’s anus or vice versa.\n3. Oral sex. Bacteria passes from one person’s mouth to their partner’s penis, vagina, or anus,or vice versa.\n4. Sex involving toys. Bacteria pass from a toy with the bacteria to a person’s mouth, penis, vagina or anus.\n5. Manual stimulation of the genitals or anus. Less commonly, infected vaginal fluid or semen can come in contact with a person’s eye, causing an infection called conjunctivitis. For example, this can happen if you touch the genitals of an infected person and then rub your eyes without washing your hands first.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT DOESN’T CAUSE CHLAMYDIA?"),
                      message(
                        "Not all situations involving an exchange of body fluids or intimacy cause chlamydia. You can’t get chlamydia from:\n1. Kissing.\n2. Sharing food or drinks.\n3. Hugging or holding hands.\n4. sing a toilet after someone else.\n5. Inhaling droplets after someone coughs or sneezes.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW LONG CAN YOU HAVE CHLAMYDIA WITHOUT KNOWING?"),
                      message(
                        "Chlamydia is sometimes called a silent infection because the majority of people who have chlamydia — regardless of gender — never notice symptoms. People who do notice symptoms often don’t recognize the signs that they have chlamydia until a few weeks after they’ve been infected. Because chlamydia cases are often asymptomatic, it’s easy to spread chlamydia to someone else without realizing it. And it’s easy to miss out on receiving the treatment needed to prevent the serious complications that can result from chlamydia.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT ARE THE SYMPTOMS OF CHLAMYDIA?"),
                      message(
                        "If you do notice symptoms, you’ll likely experience them differently based on your reproductive anatomy. Many of the symptoms that cisgender women experience can also affect transgender men and nonbinary individuals with vaginas. Many of the symptoms that cisgender men notice can affect transgender women and nonbinary individuals with penises, too.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("Signs Of Chlamydia If You Have a Vagina"),
                      message(
                        "Chlamydia bacteria often cause symptoms that are similar to cervicitis or a urinary tract infection(UTI). You may notice:\n1. White, yellow or gray discharge from your vagina that may be smelly.\n2. Pus in your urine (pyuria).\n3. Increased need to pee.\n4. Pain or a burning sensation when you pee (dysuria).\n5. Bleeding in between periods.\n6. Painful periods.\n7. Painful intercourse (dyspareunia).\n8. Itching or burning in and around your vagina.\n9. Dull pain in the lower part of your abdomen.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("Signs Of Chlamydia If You Have a Penis"),
                      message(
                        "Chlamydia bacteria most often infect your urethra, causing symptoms that are similar to nongonococcal urethritis. You may notice:\n1. Mucus-like or clear, watery discharge from your penis.\n2. Pain or a burning sensation when you pee (dysuria).",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("Signs Of Chlamydia That All Genders May Notice"),
                      message(
                        "Chlamydia can affect parts of your body other than your reproductive organs, such as your:\n1.Anus. You may notice pain, discomfort, bleeding or a mucus-like discharge from your bottom.\n2 Throat. You may have a sore throat, but you usually won’t notice symptoms if the bacteria is in your throat.\n 3. Eyes. You may notice symptoms of conjunctivitis if C. trachomatis bacteria gets in your eye. Symptoms include redness, pain and discharge.See your healthcare provider immediately if you notice any of these symptoms.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS CHLAMYDIA DIAGNOSED?"),
                      message(
                        "The most common test for chlamydia is called a nucleic acid amplification test (NAAT). Your provider takes a sample of fluid by doing a vaginal/cervical swab or collecting a urine sample. Then,they send the sample off to a lab to check for the bacteria that causes chlamydia. Your provider may do the test in an office, or they may ask you to do an at-home chlamydia test. Follow your provider’s instructions carefully to ensure you get accurate test results. Because most chlamydia cases are asymptomatic, it’s important to get screened for chlamydia even if you don’t notice any signs of infection. The CDC recommends that sexually active cisgender women who are high-risk for chlamydia get screened regularly. Women, more so than men, experience the most severe complications from chlamydia. Transgender men and nonbinary individuals with vaginas should be screened regularly, too, as they can experience the same complications of chlamydia.You’re considered high-risk if you:\nAre under 25.\nAre pregnant.\nHave a new partner.\nHave multiple partners.\nHave had chlamydia infections previously.\nCisgender men, or trans and nonbinary individuals with penises, should be screened for chlamydia.if:\n1. They live in a setting where chlamydia spreads frequently, like correctional facilities,adolescent clinics and sexual health clinics.\nThey have sex with other men.\nRegardless of your age, reproductive anatomy, or other risk factors — you should discuss your sexual history and sexual activity with your healthcare provider. Your provider is your best resource for offering guidance on how often you should be tested for chlamydia and other STIs.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW IS CHLAMYDIA TREATED?"),
                      message(
                        "Chlamydia can be cleared up with antibiotics in about a week or two. But don’t stop taking your medication just because your symptoms improve. Ask your provider about what follow-up is needed to be sure your infection is gone after you’ve finished taking your medicine.Part of your treatment should also include avoiding sexual activities that could cause you to get re-infected and ensuring that any sexual partners who may be infected also get treatment. You should:\n1. Abstain from sex until your infection has cleared up. Starting treatment doesn’t mean that you’re in the clear. Take all your medication as your provider directs, and avoid all sexual contact in the meantime.\n2. Contact all sexual partners. Tell any sexual partners from the last 3 months that you’re infected so that they can get tested, too.\n3. Get tested for other STIs (HIV/AIDS, syphilis, herpes, gonorrhea). It’s common to have multiple STIs, and it’s important to receive treatment that’s tailored to each infection. Antibiotics can get rid of your infection, but they can’t reverse any harm the bacteria may have caused to your body before treatment. This is why it’s so important to get screened regularly forchlamydia, to see your provider at the first sign of symptoms, and get treatment immediately if you’re infected.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title(
                          "WHAT MEDICATIONS ARE USED TO GET RID OF CHLAMYDIA?"),
                      message(
                        "The most common antibiotics used to treat chlamydia infections are:\nAzithromycin. Usually taken as a single dose.\nDoxycycline. Usually taken over 7 days.Make sure you only take antibiotics prescribed by your provider, and take all medications until they’re gone, even if your symptoms improve.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW CAN I PROTECT MYSELF FROM CHLAMYDIA?"),
                      message(
                        "The only way to avoid getting chlamydia is to abstain from having vaginal, anal or oral sex with someone who has a chlamydia infection. And be sure that sex toys that carry the bacteria don’t come in contact with your genitals.It’s not always possible to know if a current or potential partner has chlamydia, though, especially since many people with chlamydia never notice symptoms. With prevention in mind, it’s a good idea to make safer sex practices a regular part of your sex life:\n1. Use condoms during intercourse, anal sex and oral sex.\n2. Use dental dams during oral sex or vagina-to-vagina contact.\n3. Don’t share sex toys, but if you do, wash them after each use and cover toys used for penetration with a condom.\n4 Have sex with only one partner, who only has sex with you.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW LONG DOES CHLAMYDIA LAST?"),
                      message(
                        "With treatment, chlamydia should go away within a week or two. It’s important to take all antibiotics to fight the infection. Don’t have sex during treatment, or you could get reinfected.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      title("DOES CHLAMYDIA GO AWAY ON ITS OWN?"),
                      message(
                        "You should never wait for chlamydia to go away on its own. Left untreated, chlamydia can cause serious harm to your health. If you are sexually active, you run the risk of infecting others, putting them at risk of experiencing severe complications as well",
                      ),
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
