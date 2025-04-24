import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/chatList.dart';
import 'package:narpion_app/details.dart';
import 'package:narpion_app/notification.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottomsheet.dart';
import 'package:narpion_app/stepper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> imageList = [
    'assets/images/Frame 63.png',
    'assets/images/Frame 63.png',
    'assets/images/Frame 63.png',
  ];
  int _selectedCategoryIndex = -1; // No category selected initially

  final List<Map<String, String>> categories = [
    {'name': 'الرماية', 'image': 'assets/images/Vector-4.svg'},
    {'name': 'البادل', 'image': 'assets/images/Vector-3.svg'},
    {'name': 'تنس الطاولة', 'image': 'assets/images/Vector-2.svg'},
    {'name': 'الكل', 'image': 'assets/images/Category.svg'},
  ];

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          "نــــاربيون",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),

        // LEFT SIDE BUTTON
        leading: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Center(
            child: SizedBox(
              height: 40, // Set the desired height here
              width: 70,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Subtract.png", height: 16),
                    const SizedBox(width: 1),
                    const Text(
                      '75',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // RIGHT SIDE BUTTONS
        actions: [
          GestureDetector(onTap: () {
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotificationsView()), // غيّر NextScreen لشاشتك التالية
      );
          },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset('assets/images/notification-03.svg',
                  height: 24),
            ),
          ),
          GestureDetector(onTap: () {
                 Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatListView()), // غيّر NextScreen لشاشتك التالية
      );
          },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset('assets/images/message-01.svg', height: 24),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Image.asset("assets/images/Avatar.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'صباح الخير , ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Rubik",
                              ),
                            ),
                            TextSpan(
                              text: 'محمد',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                                fontFamily: "Rubik",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/locationMap.svg",
                            height: 20,
                            width: 10,
                          ),
                          Text("مكة - العوالي - شارع ابراهيم الجفالي ",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 10)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                bool isActive = _currentIndex == entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 20 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    borderRadius:
                        BorderRadius.circular(8), // ✅ rounded ends for all
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    bool isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                        if(_selectedCategoryIndex == 3){
                          showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => SelectSportSheet(),
);

                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade200,
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                category['image']!,
                                height: 30,
                                fit: BoxFit.fill,
                                width: 30,
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(category['name']!)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 35),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Padding(
            // padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: Container(height: 40,

            //     decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.circular(15)
            //   ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               Text("الترتيب"),const SizedBox(width: 5),
            //               SvgPicture.asset("assets/images/arrow-down-up.svg")
            //             ],
            //           ),
            //            Row(
            //             children: [
            //               Text("التصنيف"),const SizedBox(width: 5),
            //               SvgPicture.asset("assets/images/filter.svg")
            //             ],
            //           ),
            //            Row(
            //             children: [
            //               Text("الخريطة"),const SizedBox(width: 5),
            //               SvgPicture.asset("assets/images/map.svg")
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // )
            if (_selectedCategoryIndex == 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(height: 50,),
                  Text(
                    "أختر منافسك ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'لايوجد تحدي ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50, // Set your desired height
                    width: 300, // Set your desired width

                    child: ElevatedButton(
                      onPressed: () {
                                  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompetitionStepper()), // غيّر NextScreen لشاشتك التالية
      );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'إنشاء تحدي جديد',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            if (_selectedCategoryIndex != 1)
              GridView.builder(
                shrinkWrap: true, // ✅ Important to avoid infinite height
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 6 / 9,
                ),
                itemCount: 4, // Only 4 items
                itemBuilder: (context, index) {
                  final category = categories[index];
                  bool isSelected = _selectedCategoryIndex == index;

                  return GestureDetector(onTap: () {
                  
                                    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen()), // غيّر NextScreen لشاشتك التالية
      );
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2, // How wide the shadow spreads
                            blurRadius: 6, // Softness of the shadow
                            offset: Offset(0, 3), // X and Y offset
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/img1.png",
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Image.asset("assets/images/Avatar.png"),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text("عمار"),
                                      Image.asset(
                                        "assets/images/logo 3d 2.png",
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ]),
                                    SizedBox(height: 2),
                                    Text(" 100,000 نقطة ",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 10)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "ملعب بادل",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/calendar.svg",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.fill,
                                ),
                                Text("الثلاثاء , 15 أبريل 2025 ",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/time.svg",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.fill,
                                ),
                                Text("06:00م",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/locationMap.svg",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.fill,
                                ),
                                Text("بصمة الخيال , الشوقية مكة",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/Screenshot_1446-10-22_at_11.43.23_PM-removebg-preview.png",
                                  width: 60,
                                  height: 40,
                                  fit: BoxFit.fill,
                                ),
                                GestureDetector(
                                  onTap: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen()), // غيّر NextScreen لشاشتك التالية
      );},
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.primaryColor),
                                    child: Center(
                                        child: Text(
                                      "انضم للمنافسة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
