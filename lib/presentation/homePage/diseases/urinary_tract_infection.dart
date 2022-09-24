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

class UrinaryTractScreen extends StatefulWidget {
  const UrinaryTractScreen({Key? key}) : super(key: key);

  @override
  _UrinaryTractScreenState createState() => _UrinaryTractScreenState();
}

class _UrinaryTractScreenState extends State<UrinaryTractScreen> {
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
                      Header(text: "URINARY TRACT")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      title("WHAT IS URINARY TRACT INFECTION (UTI)"),
                      message(
                          "A urinary tract infection (UTI) is an infection of the urinary system. This type of infection can involve your urethra (a condition called urethritis), kidneys (a condition called pyelonephritis) or bladder,(a condition called cystitis). Your urine typically doesn’t contain bacteria (germs). Urine is a byproduct of our filtration system—the kidneys. When waste products and excess water is removed from your blood by the kidneys, urine is created. Normally, urine moves through your urinary system without any contamination. However, bacteria can get into the urinary system from outside of the body,causing problems like infection and inflammation. This is a urinary tract infection (UTI).The urinary tract makes and stores urine, one of the body's liquid waste products. The urinary tract includes the following parts:\n1. Kidneys: These small organs are located on back of your body, just above the hips. They are the filters of your body — removing waste and water from your blood. This waste becomes urine.\n2. Ureters: The ureters are thin tubes that carry urine from the kidneys to your bladder.\n3. Bladder: A sac-like container, the bladder stores your urine before it leaves the body.\n4. Urethra: This tube carries the urine from your bladder to the outside of the body."),
                      SizedBox(
                        height: 10,
                      ),
                      title("WHAT CAUSES A URINARY TRACT INFECTION (UTI)?"),
                      message(
                          "Urinary tract infections are caused by microorganisms — usually bacteria — that enter the urethra and bladder, causing inflammation and infection. Though a UTI most commonly happens in the urethra and bladder, bacteria can also travel up the ureters and infect your kidneys.More than 90% of bladder infection (cystitis) cases are caused by E. coli, a bacterium normally found in the intestines."),
                      SizedBox(
                        height: 10,
                      ),
                      title(
                          "WHAT ARE THE SYMPTOMS OF A URINARY TRACT INFECTION (UTI)?"),
                      message(
                          "A urinary tract infection causes the lining of the urinary tract to become red and irritated (inflammation), which may produce some of the following symptoms:\n1. Pain in the side (flank), abdomen or pelvic area.\n2. Pressure in the lower pelvis.\n3. Frequent need to urinate (frequency), urgent need to urinate (urgency) and Incontinence (urine leakage).\n4. Painful urination (dysuria) and blood in the urine.\n5. The need to urinate at night.\n6. Abnormal urine color (cloudy urine) and strong or foul-smelling urine.\nOther symptoms that may be associated with a urinary tract infection include:\n1. Pain during sex.\n2. Penis pain.\n3. Flank (side of the body) pain or lower back pain.\n4. Fatigue.\n5. Fever (temperature above 100 degrees Fahrenheit) and chills.\n5. Vomiting.\n6. Mental changes or confusion."),
                      SizedBox(
                        height: 10,
                      ),
                      title(
                          "HOW ARE URINARY TRACT INFECTIONS (UTIS) DIAGNOSED?"),
                      message(
                          "Your doctor will use the following tests to diagnose a urinary tract infection:\n1. Urinalysis: This test will examine the urine for red blood cells, white blood cells and bacteria. The number of white and red blood cells found in your urine can actually indicate an infection.\n2. Urine culture: A urine culture is used to determine the type of bacteria in your urine. This is an important test because it helps determine the appropriate treatment.\nIf your infection does not respond to treatment or if you keep getting infections over and over again, your doctor may use the following tests to examine your urinary tract for disease or injury:\n1. Ultrasound: In this test, sound waves create an image of the internal organs. This test is done on top of your skin, is painless and doesn’t typically need any preparation.\n2. Cystoscopy: This test uses a special instrument fitted with a lens and a light source (cystoscope) to see inside the bladder from the urethra.\n3. CT scan: Another imaging test, a CT scan is a type of X-ray that takes cross sections of the body (like slices). This test is much more precise than typical X-rays."),
                      SizedBox(
                        height: 10,
                      ),
                      title("HOW ARE URINARY TRACT INFECTIONS TREATED?"),
                      message(
                          "You will need to treat a urinary tract infection. Antibiotics are medicines that kill bacteria and fight an infection. Antibiotics are typically used to treat urinary tract infections. Your healthcare provider will pick a drug that best treats the particular bacteria that’s causing your infection. Some commonly used antibiotics can include:\n1. Nitrofurantoin.\n2. Sulfonamides (sulfa drugs).\n3. Amoxicillin.\n4. Cephalosporins.\n5. Trimethoprim/sulfamethoxazole (Bactrim®).\n6. Doxycycline.\n7. Quinolones (such as ciprofloxacin [Cipro®]).\nIt’s very important that you follow your healthcare provider’s directions for taking the medicine.Don’t stop taking the antibiotic because your symptoms go away and you start feeling better. If the infection is not treated completely with the full course of antibiotics, it can return.If you have a history of frequent urinary tract infections, you may be given a prescription for antibiotics that you would take at the first onset of symptoms. Other patients may be given antibiotics to take every day, every other day, or after sexual intercourse to prevent the infection.Talk to your healthcare provider about the best treatment option for you if you have a history of frequent UTIs."),
                      SizedBox(
                        height: 10,
                      ),
                      title("CAN I PREVENT URINARY TRACT INFECTION (UTI)?"),
                      message(
                          "You can usually prevent a urinary tract infection (UTI) with lifestyle changes. These tips can include:\n1. Practicing good hygiene: You can often prevent UTIs by practicing good personal hygiene.This is especially important for women. Because the urethra in women is much shorter than it is in men, it’s easier for E. coli bacteria to move from the rectum back into the body.To avoid this, it’s recommended that you always wipe from front to back after a bowel movement. Women should also use good hygiene practices during their menstrual cycle avoid infections. Changing pads and tampons frequently, as well as not using feminine deodorants can also help prevent UTIs.\n2. Drinking plenty of fluids: Adding extra fluids, especially water, to your daily routine can help remove extra bacteria from your urinary tract. Drinking six to eight glasses of water per day is recommended.\n3. Changing your urination habits: Urination can play a big role in getting rid of bacteria from the body. Your urine is a waste product and each time you empty your bladder, you’re removing that waste from your body. Urinating frequently can reduce your risk of developing an infection, especially if you have a history of frequent UTIs. Drinking plenty of fluids will encourage this, but makes sure to avoid fluids and foods that could irritate your bladder. These can include alcohol, citrus juices, caffeinated drinks and spicy foods.You should also try to urinate immediately before and after sex. This could help flush out any bacteria that may have been introduced during intercourse. You can also wash the genital area with warm water before having sex. Don’t douche. This practice isn’t recommended by healthcare providers.\n4. Changing your birth control: Some women have an increased risk of developing a UTI if they use a diaphragm for birth control. Talk to your healthcare provider about other options for birth control.\n5. Using a water-based lubricant during sex: If you experience vaginal dryness and use a lubricant during sex, use one that is water-based. You may also need to avoid spermicide if you have frequent UTIs.\n6. Changing your clothing: Avoiding tight-fitting clothing can actually help keep you dry,preventing bacteria from growing in the urinary tract. You can also switch to cotton underwear. This will prevent extra moisture from getting trapped around your urethra.In some post-menopausal women, a healthcare provider may suggest an estrogen-containing vaginal cream. This may reduce the risk of developing a UTI by changing the pH of the vagina. Talk to your healthcare provider if you have recurrent UTIs and have already gone through menopause.Over-the-counter supplements are also available for UTIs. These are sometimes recommended for people who have frequent UTIs as another way to prevent them. Talk to your health"),
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
