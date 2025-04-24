import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/shared/appColor.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  final List<Map<String, dynamic>> rankings = [
    {
      "rank": 1,
      "name": "سعيد عبدالله",
      "avatar": "assets/images/Avatar-4.png",
      "xp": "300 XP"
    },
    {
      "rank": 2,
      "name": "محمد صالح",
      "avatar": "assets/images/Avatar-5.png",
      "xp": "270 XP"
    },
    {
      "rank": 3,
      "name": "أحمد فهد",
      "avatar": "assets/images/Avatar-6.png",
      "xp": "250 XP"
    },
    // Add more items up to 15 or however many you need
  ];
  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor, // Adjust AppColors as needed
          centerTitle: true,
          title: const Text(
            "الترتيبات",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "30 يوم على انتهاء الموسم",
                style: TextStyle(color: Color(0xff6A656E)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2, left: 2),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0XFFF2F2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Set the background color here
                  //  color: Color(0XFF384250).withOpacity(.3), // or any color you prefer
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 1.0,
                    padding: const EdgeInsets.all(4),
                    dividerColor: Colors.transparent,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    tabs: [
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Centers the row content
                          children: [
                            // SvgPicture.asset(
                            //   "assets/images/mosque-location.svg",width: 15,
                            //   // height: 24.0, // Set the icon size as needed
                            // ),
                            //  SizedBox(
                            //     width:
                            //         widthApp*0.01), // Add spacing between the icon and text
                            const Text(
                              'الجميع',
                              style: TextStyle(
                                fontSize: 12.0, // Set text size
                                fontWeight: FontWeight
                                    .w600, // Optional: Set font weight
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Centers the row content
                          children: [
                            Image.asset(
                              "assets/images/صورة واتساب بتاريخ 1446-10-10 في 17.24.01_b93d0891 1-4.png",
                              width: 20,
                              // height: 24.0, // Set the icon size as needed
                            ),
                            SizedBox(
                                width:
                                    5), // Add spacing between the icon and text
                            const Text(
                              "برونزي",
                              style: TextStyle(
                                fontSize: 12.0, // Set text size
                                fontWeight: FontWeight
                                    .w600, // Optional: Set font weight
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Centers the row content
                          children: [
                            Image.asset(
                              "assets/images/logo 3d 2-3.png", width: 20,
                              // height: 24.0, // Set the icon size as needed
                            ),
                            SizedBox(width: 5),
                            const Text(
                              "فضي",
                              style: TextStyle(
                                fontSize: 12.0, // Set text size
                                fontWeight: FontWeight
                                    .w600, // Optional: Set font weight
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Centers the row content
                          children: [
                            Image.asset(
                              "assets/images/logo 3d 3.png", width: 20,
                              // height: 24.0, // Set the icon size as needed
                            ),
                            SizedBox(width: 5),
                            const Text(
                              "ذهبي",
                              style: TextStyle(
                                fontSize: 12.0, // Set text size
                                fontWeight: FontWeight
                                    .w600, // Optional: Set font weight
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: Image.asset("assets/images/Frame 8.png")),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0XFFF8F8F8),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Padding for the content

                        child: DropdownButton<String>(
                          icon: SvgPicture.asset(
                              "assets/images/arrow-down-01.svg"),
                          value: selectedValue,
                          hint: Text('الرياضة'),
                          isExpanded: true, // Expands the dropdown button
                          underline: SizedBox(), // Hides the default underline
                          items: <String>['مكة', 'جدة', 'الرياض']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 110,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Padding for the content

                        child: DropdownButton<String>(
                          icon: SvgPicture.asset(
                              "assets/images/arrow-down-01.svg"),
                          value: selectedValue,
                          hint: Text('الاصدقاء'),
                          isExpanded: true, // Expands the dropdown button
                          underline: SizedBox(), // Hides the default underline
                          items: <String>['مكة', 'جدة', 'الرياض']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Padding for the content

                        child: DropdownButton<String>(
                          icon: SvgPicture.asset(
                              "assets/images/arrow-down-01.svg"),
                          value: selectedValue,
                          hint: Text('المدينة'),
                          isExpanded: true, // Expands the dropdown button
                          underline: SizedBox(), // Hides the default underline
                          items: <String>['مكة', 'جدة', 'الرياض']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16), // Padding for the content

                        child: DropdownButton<String>(
                          icon: SvgPicture.asset(
                              "assets/images/arrow-down-01.svg"),
                          value: selectedValue,
                          hint: Text('العالم'),
                          isExpanded: true, // Expands the dropdown button
                          underline: SizedBox(), // Hides the default underline
                          items: <String>['مكة', 'جدة', 'الرياض']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("التصنيف"),
                        Text("اللاعب"),
                        Text("النقاط")
                      ],
                    ),
                  )),
              Expanded(
                child: TabBarView(
                  children: [
                    // First Tab for Ranking
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: rankings.length, // Show 15 rankings
                        itemBuilder: (context, index) {
                          final item = rankings[index];
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(item['rank'].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(item['avatar']),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(item['name'].toString()),
                                    ],
                                  ),
                                  Text(
                                    item['xp'].toString(),
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                  // ListTile(
                                  //   title: Text(rankings[index]),
                                  //   leading: Icon(Icons.star),
                                  //   onTap: () {
                                  //     // Add any actions when tapping the ranking
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Second Tab (You can modify this as per your needs)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: rankings.length, // Show 15 rankings
                        itemBuilder: (context, index) {
                          final item = rankings[index];
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(item['rank'].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(item['avatar']),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(item['name'].toString()),
                                    ],
                                  ),
                                  Text(
                                    item['xp'].toString(),
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                  // ListTile(
                                  //   title: Text(rankings[index]),
                                  //   leading: Icon(Icons.star),
                                  //   onTap: () {
                                  //     // Add any actions when tapping the ranking
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: rankings.length, // Show 15 rankings
                        itemBuilder: (context, index) {
                          final item = rankings[index];
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(item['rank'].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(item['avatar']),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(item['name'].toString()),
                                    ],
                                  ),
                                  Text(
                                    item['xp'].toString(),
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                  // ListTile(
                                  //   title: Text(rankings[index]),
                                  //   leading: Icon(Icons.star),
                                  //   onTap: () {
                                  //     // Add any actions when tapping the ranking
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: rankings.length, // Show 15 rankings
                        itemBuilder: (context, index) {
                          final item = rankings[index];
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(item['rank'].toString()),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(item['avatar']),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(item['name'].toString()),
                                    ],
                                  ),
                                  Text(
                                    item['xp'].toString(),
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                  // ListTile(
                                  //   title: Text(rankings[index]),
                                  //   leading: Icon(Icons.star),
                                  //   onTap: () {
                                  //     // Add any actions when tapping the ranking
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
