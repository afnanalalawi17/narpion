import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/shared/appColor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {}); // Rebuild UI on tab change
    });
  }

  final List<Map<String, dynamic>> rankings = [
    {
      "name": "غدير",
      "Competition": "البادل",
      "Result": "فزت",
      "avatar": "assets/images/Avatar-10.png",
      "xp": "20/05"
    },
    {
      "name": "محمد",
      "Competition": "البولينج",
      "Result": "خسرت",
      "avatar": "assets/images/Avatar-11.png",
      "xp": "20/05"
    },
    {
      "name": "عمار",
      "Competition": "القولف",
      "Result": "تعادل",
      "avatar": "assets/images/Avatar-12.png",
      "xp": "20/05"
    },
    {
      "name": "سعد",
      "Competition": "البادل",
      "Result": "فزت",
      "avatar": "assets/images/Avatar-13.png",
      "xp": "20/05"
    },
    {
      "name": "غدير",
      "Competition": "البادل",
      "Result": "خسرت",
      "avatar": "assets/images/Avatar-10.png",
      "xp": "20/05"
    },
    // Add more items up to 15 or however many you need
  ];
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color getIconColor(int index) {
    return _tabController.index == index ? Colors.white : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
                title: const Text(
                  "الملف الشخصي",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Center vertically

                    children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -44,
                        right: 0,
                        child: Image.asset(
                          "assets/images/Group 1171274825.png",
                          height: 80, // adjust size as needed
                          width: 80, fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/Frame 1171274859.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: AppColors.primaryColor
                            .withOpacity(0.1), // 🔴 Color overlay with opacity
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'سعد الجهني ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                ),
                              ),
                              TextSpan(
                                text: 'بطل رياضة البادل',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15,
                                  fontFamily: "Rubik",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "@dagnt1l",
                          style: TextStyle(color: Color(0xff6A656E)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            "لاعب بادل محترف اتميز بمهارات عالية في التحكم بالمضرب داخل الملعب. شاركت في عدة بطولات و حققت مراكز عالية",
                            style: TextStyle(color: Color(0xff6A656E)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/images/user.svg"),
                                  const SizedBox(width: 5),
                                  Text(
                                    "ذكر",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/location-06.svg"),
                                  const SizedBox(width: 5),
                                  Text(
                                    "مكة, الشوقية",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/calendar-04.svg"),
                                  const SizedBox(width: 5),
                                  Text(
                                    "16 - 11 - 2003",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("305"),
                                  Text(
                                    "المنافسات",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("34.5K"),
                                  Text(
                                    "المتابعون",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("0"),
                                  Text(
                                    "متابع",
                                    style: TextStyle(color: Color(0xff6A656E)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 2, left: 2),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0XFFF2F2F2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // Set the background color here
                            //  color: Color(0XFF384250).withOpacity(.3), // or any color you prefer
                            child: TabBar(
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorWeight: 1.0,
                              // padding: const EdgeInsets.all(4),
                              dividerColor: Colors.transparent,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryColor,
                              ),
                              tabs: [
                                SvgPicture.asset(
                                  "assets/images/shape-2.svg",
                                  width: 20, color: getIconColor(0),
                                  // height: 24.0, // Set the icon size as needed
                                ),
                                SvgPicture.asset(
                                  "assets/images/versus.svg", width: 30,
                                  color: getIconColor(1),
                                  // height: 24.0, // Set the icon size as needed
                                ),
                                SvgPicture.asset(
                                  "assets/images/medal-first-place.svg",
                                  width: 20, color: getIconColor(2),
                                  // height: 24.0, // Set the icon size as needed
                                ),
                              ],
                            ),
                          ),
                        ), SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("المنافس", style: TextStyle(color: Color(0xff6A656E), fontSize: 16),),
                     Container(
                      width: 120,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16), // Padding for the content
                  
                      child: DropdownButton<String>(
                        icon: SvgPicture.asset(
                            "assets/images/arrow-down-01.svg"),
                        value: selectedValue,
                        hint: Text('المنافسة'),
                        isExpanded: true, // Expands the dropdown button
                        underline: SizedBox(), // Hides the default underline
                        items: <String>['بادل', 'بوليج', 'تنس']
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
                        value: selectedValue2,
                        hint: Text('النتيجة'),
                        isExpanded: true, // Expands the dropdown button
                        underline: SizedBox(), // Hides the default underline
                        items: <String>['فزت', 'خسرت', 'تعادل']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue2 = newValue;
                          });
                        },
                      ),
                    ),  Container(
                      width: 100,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16), // Padding for the content
                  
                      child: DropdownButton<String>(
                        icon: SvgPicture.asset(
                            "assets/images/arrow-down-01.svg"),
                        value: selectedValue3,
                        hint: Text('التاريخ'),
                        isExpanded: true, // Expands the dropdown button
                        underline: SizedBox(), // Hides the default underline
                        items: <String>['فبراير', 'مارس', 'يوليو']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue3 = newValue;
                          });
                        },
                      ),
                    ),
                    ],
                  )),
                        SizedBox(
                          height:
                              300, // or MediaQuery.of(context).size.height * 0.5
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount:
                                      rankings.length, // Show 15 rankings
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
                                                Image.asset(item['avatar']),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  item['name'].toString(),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            Text(item['Competition']
                                                .toString()),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              item['Result'].toString(),
                                              style: TextStyle(
                                                  color: item['Result']
                                                              .toString() ==
                                                          "فزت"
                                                      ? Colors.green
                                                      : item['Result']
                                                                  .toString() ==
                                                              "خسرت"
                                                          ? Colors.red
                                                          : Colors.grey),
                                            ),
                                            Text(
                                              item['xp'].toString(),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount:
                                      rankings.length, // Show 15 rankings
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
                                                Image.asset(item['avatar']),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  item['name'].toString(),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            Text(item['Competition']
                                                .toString()),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              item['Result'].toString(),
                                              style: TextStyle(
                                                  color: item['Result']
                                                              .toString() ==
                                                          "فزت"
                                                      ? Colors.green
                                                      : item['Result']
                                                                  .toString() ==
                                                              "خسرت"
                                                          ? Colors.red
                                                          : Colors.grey),
                                            ),
                                            Text(
                                              item['xp'].toString(),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 20,
                                    );
                                  },
                                  itemCount:
                                      rankings.length, // Show 15 rankings
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
                                                Image.asset(item['avatar']),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  item['name'].toString(),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            Text(item['Competition']
                                                .toString()),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              item['Result'].toString(),
                                              style: TextStyle(
                                                  color: item['Result']
                                                              .toString() ==
                                                          "فزت"
                                                      ? Colors.green
                                                      : item['Result']
                                                                  .toString() ==
                                                              "خسرت"
                                                          ? Colors.red
                                                          : Colors.grey),
                                            ),
                                            Text(
                                              item['xp'].toString(),
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
                ]))));
  }
}
