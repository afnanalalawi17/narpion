
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/register.dart';
import 'package:narpion_app/shared/appColor.dart';

class OnboardingView extends StatefulWidget {
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _pageController = PageController();
  int currentPage = 0;

  List<String> titles = ["اختر رياضتك", "لا تلعب لوحدك", "ارفع مستواك "];
  List<String> descriptions = [
    "مع ناربيون يساعدك في اختيار شغفك بالرياضة",
"اختر منافس حولك أو اترك الموضوع على ناربيون\nيختار لك منافس مناسب لك",    "حساب النقاط مع ناربيون خلك دايم في القمة "
  ];
 List<String> images = [
    "assets/images/boarding1.png",
    "assets/images/boarding2.png",
    "assets/images/boarding3.png"
  ];
  void nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()), // غيّر NextScreen لشاشتك التالية
      );
      // Get.offAll(() => HomeScreen()); // Replace with your home screen
    }
  }

  void skip() {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()), // غيّر NextScreen لشاشتك التالية
      );
    // Get.offAll(() => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryColor,
    
    elevation: 0, // removes shadow
   
),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(images[index].toString()),
                      SizedBox(height: 40),
                      Text(
                        titles[index],
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 20),
                      Text(
                        descriptions[index],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.grey ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(
    descriptions.length,
    (index) => Container(
      margin: const EdgeInsets.all(4),
      width: currentPage == index ?30:30 ,
      height: currentPage == index ?5:5,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColors.primaryColor
            : Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
                TextButton(
                  onPressed: nextPage,
                  child: Text(
                    currentPage == 2 ? "ابدأ" : "التالي",
                    style: TextStyle(fontSize: 18, color:AppColors.primaryColor, fontWeight: FontWeight.normal ),
                  ),
                ), TextButton(
                  onPressed: skip,
                  child: Text("تخطي", style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.normal),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}