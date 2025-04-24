import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/details.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottomsheet.dart';
import 'package:narpion_app/startChatAI.dart';

class SeachView extends StatefulWidget {
  const SeachView({super.key});

  @override
  State<SeachView> createState() => _SeachViewState();
}

class _SeachViewState extends State<SeachView> {
  int selectedIndex = 0;
  int _selectedCategoryIndex = -1; // No category selected initially

  final List<Map<String, String>> categories = [
    {'name': 'الرماية', 'image': 'assets/images/Vector-4.svg'},
    {'name': 'البادل', 'image': 'assets/images/Vector-3.svg'},
    {'name': 'تنس الطاولة', 'image': 'assets/images/Vector-2.svg'},
    {'name': 'الكل', 'image': 'assets/images/Category.svg'},
  ];
  final List<String> listOne = [
    "assets/images/card.png",
    "assets/images/card-2.png",
    "assets/images/card-3.png",
    "assets/images/card-4.png"
  ];
  final List<String> listTwo = ['منافس 1', 'منافس 2', 'منافس 3'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text(
            "البحث",
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(
                        horizontal: 16), // Padding for the content
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD4D4D4), // Border color
                        // width: 2, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          30), // Border radius for rounded corners
                    ),
                    child: DropdownButton<String>(
                      icon: SvgPicture.asset("assets/images/arrow-down-01.svg"),
                      value: selectedValue,
                      hint: Text('مكة'),
                      isExpanded: true, // Expands the dropdown button
                      underline: SizedBox(), // Hides the default underline
                      items:
                          <String>['مكة', 'جدة', 'الرياض'].map((String value) {
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(onTap: () {
                         Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StartChatAIScreen()), // غيّر NextScreen لشاشتك التالية
                                );
                      },
                        child: TextField(
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            hintText: 'ابحث عن منافسين أو ملاعب',
                            hintStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                            hintTextDirection: TextDirection.rtl,
                            prefixIcon: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StartChatAIScreen()), // غيّر NextScreen لشاشتك التالية
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/Ellipse 8-2.png",
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xFFD4D4D4), // Light gray border
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color:
                                    Color(0xFFD4D4D4), // Slightly darker on focus
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  toggleButton("ملاعب", 0),
                  SizedBox(width: 10),
                  toggleButton("منافسين", 1),
                ],
              ),
              SizedBox(height: 20),
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
                          });    if(_selectedCategoryIndex == 3){
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
                                borderRadius: BorderRadius.circular(20),
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
                        const SizedBox(width: 25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0XFFF8F8F8),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("الترتيب"),
                          const SizedBox(width: 5),
                          SvgPicture.asset("assets/images/arrow-down-up.svg")
                        ],
                      ),
                      Row(
                        children: [
                          Text("التصنيف"),
                          const SizedBox(width: 5),
                          SvgPicture.asset("assets/images/filter.svg")
                        ],
                      ),
                      Row(
                        children: [
                          Text("الخريطة"),
                          const SizedBox(width: 5),
                          SvgPicture.asset("assets/images/map.svg")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: selectedIndex == 0 ? listOne.length : listTwo.length,
                itemBuilder: (context, index) {
                  final item =
                      selectedIndex == 0 ? listOne[index] : listTwo[index];
                  return selectedIndex == 0
                      ? Image.asset(
                          item,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen()), // غيّر NextScreen لشاشتك التالية
                            );
                          },
                          child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                  color: Color(0XFFF8F8F8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/Group 1171274825.png"),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("سعد الجهني "),
                                                    Image.asset(
                                                        "assets/images/narpion-bronze 1.png")
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "@dagnt1l",
                                                  style: TextStyle(
                                                      color: Color(0xff6A656E)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 55),
                                          child: Text(
                                            "لاعب بادل محترف اتميز بمهارات عالية في التحكم بالمضرب داخل الملعب. شاركت في عدة بطولات و حققت مراكز عالية",
                                            style: TextStyle(
                                                color: Color(0xff6A656E)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 55),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/images/user.svg"),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "ذكر",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff6A656E)),
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
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff6A656E)),
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
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff6A656E)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ]))),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleButton(String title, int index) {
    bool isSelected = selectedIndex == index;
    return SizedBox(
      height: 40, // Set your desired height
      width: 180, // Set your desired width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0, // Removes shadow
          backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Color(0xFFD4D4D4))),
          padding: EdgeInsets.zero, // remove default padding if needed
        ),
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Text(title),
      ),
    );
  }
}
