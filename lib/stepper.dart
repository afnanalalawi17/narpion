import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/paymentSucess.dart';
import 'package:narpion_app/shared/appColor.dart';
// Flutter Stepper UI for Creating Competition
// This version replaces single scroll with a step-by-step form
// Full Flutter Stepper - Includes case 2 (المنافسين) and case 3 (الملاعب)
// Make sure assets exist in pubspec.yaml and you have flutter_svg installed

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/shared/bottombar.dart';
import 'package:narpion_app/shared/bottomsheet.dart';
import 'package:narpion_app/startChatAI.dart';

class CompetitionStepper extends StatefulWidget {
  @override
  _CompetitionStepperState createState() => _CompetitionStepperState();
}

class _CompetitionStepperState extends State<CompetitionStepper> {
  int _currentStep = 0;
  int _selectedSlotIndex = 3;
  int _selectedStadiumIndex = 3;
  int _selectedPayment = 0;
  List<String> timeSlots = [
    "7:30 - 8:30 AM",
    "9:00 - 10:00 AM",
    "10:30 - 11:30 AM",
    "1:30 - 2:30 PM",
    "3:00 - 4:00 PM",
    "4:30 - 5:30 PM",
  ];
  List<List<int>> seatStatus =
      List.generate(6, (_) => List.generate(8, (_) => 0));
  List<String> paymentMethods = ["أبل باي", "ماستر كارد"];

  List<CleanderModel> cleanderList = [
    CleanderModel(day: 'Sun', dateD: "25", dateH: "3"),
    CleanderModel(day: 'Mon', dateD: "26", dateH: "4"),
    CleanderModel(day: 'Tue', dateD: "27", dateH: "5"),
    CleanderModel(day: 'Wed', dateD: "28", dateH: "6"),
    CleanderModel(day: 'ThU', dateD: "29", dateH: "7"),
    CleanderModel(day: 'Fri', dateD: "30", dateH: "8"),
    CleanderModel(day: 'Sat', dateD: "31", dateH: "9"),
  ];
  List<Map<String, String>> stadiums = List.generate(
      4,
      (i) => {
            "title": "الملعب رقم ${i + 1}",
            "location": "ملعب الشوقية، مكة",
            "image": "assets/images/Frame 106.png"
          });
  int _selectedCategoryIndex = -1; // No category selected initially

  final List<Map<String, String>> categories = [
    {'name': 'الرماية', 'image': 'assets/images/Vector-4.svg'},
    {'name': 'البادل', 'image': 'assets/images/Vector-3.svg'},
    {'name': 'تنس الطاولة', 'image': 'assets/images/Vector-2.svg'},
    {'name': 'الكل', 'image': 'assets/images/Category.svg'},
  ];

  List<Map<String, String>> players = [
    {
      'name': 'سعد الجهني',
      'username': '@dagnt1l',
      'badge': 'assets/images/narpion-bronze 1.png',
      'image': 'https://i.pravatar.cc/150?img=4',
      'description':
          'لاعب بادل محترف يتميز بمهارات عالية في التحكم بالمضرب داخل الملعب. شارك في بطولات وحقق مراكز عالية.',
      'gender': 'ذكر',
      'location': 'مكة، الشوقية',
      'dob': '16 - 11 - 2003',
    },
    {
      'name': 'عمار علي',
      'username': '@dagnt1l',
      'badge': 'assets/images/narpion-bronze 1.png',
      'image': 'https://i.pravatar.cc/150?img=2',
      'description': 'لاعب بادل يتمتع بخبرة عالية ومهارات ممتازة.',
      'gender': 'ذكر',
      'location': 'مكة، الشوقية',
      'dob': '16 - 11 - 2003',
    },
  ];

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('إنشاء منافسة', style: TextStyle(fontWeight: FontWeight.w400),),
        leading: IconButton(
                    onPressed: () {
                      setState(() {
                        _currentStep--;
                      });
                      print(_currentStep.toString());
                    if(_currentStep != 4 || _currentStep != 3|| _currentStep != 2||_currentStep != 1||_currentStep != 0 ){
                     Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      ); 
                    }
  }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildCustomStepper(_currentStep),
            ),
            Expanded(child: buildStepContent()),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       if (_currentStep > 0)
            //         TextButton(
            //           onPressed: () => setState(() => _currentStep--),
            //           child: Text('رجوع'),
            //         ),
            //       ElevatedButton(
            //         onPressed: () {
            //           if (_currentStep < 4) setState(() => _currentStep++);
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.deepOrange,
            //           minimumSize: Size(100, 45),
            //         ),
            //         child: Text(_currentStep == 4 ? 'إنهاء' : 'التالي'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildStepContent() {
    switch (_currentStep) {
      case 0:
        return buildInfoStep();
      case 1:
        return buildPlayerStep();
      case 2:
        return buildStadiumStep();
      case 3:
        return buildSeatReservation();
      case 4:
        return buildPaymentStep();
      default:
        return buildInfoStep();
    }
  }

  Widget buildSeatReservation() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/Frame 106-2.png',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12),
          Text("الملعب رقم 1", style: TextStyle(fontWeight: FontWeight.bold)),
          Text("ملعب الشوقية , مكة", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendBox("محجوز", Colors.deepOrange),
              legendBox("متاح", Colors.white, border: true),
              legendBox("انتظار", Colors.orange.shade200),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSeatColumn(0, 3),
              SizedBox(width: 24),
              buildSeatColumn(4, 7),
            ],
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_currentStep < 4) setState(() => _currentStep++);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("تأكيد الحجز"),
          ),
        ],
      ),
    );
  }

  Widget buildInfoStep() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('اختر الرياضة', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
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
                separatorBuilder: (context, index) => const SizedBox(width: 25),
              ),
            ),
          ),
          SizedBox(height: 24),
          buildDropdown('المنطقة', 'مكة المكرمة'),
          buildTextField('اسم المنافسة', 'القوة'),
          buildTextField(
              'نبذة بسيطة عن المنافسة', 'تنس طاولة مكون من 4 لاعبين...'),
          buildDropdown('نوع المنافسة', 'اختر الجنس'),
          buildDropdown('مدة اللعب', 'اختر المدة'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_currentStep < 4) setState(() => _currentStep++);
            }, // رابط للخطوة التالية
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('التالي'),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: null,
              hint: Text(hint),
              onChanged: (_) {},
              items: [hint].map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildSeatColumn(int fromCol, int toCol) {
    return Column(
      children: List.generate(seatStatus.length, (row) {
        return Row(
          children: List.generate(toCol - fromCol + 1, (colOffset) {
            int col = fromCol + colOffset;
            int status = seatStatus[row][col];

            Color fillColor = status == 0
                ? Colors.white
                : status == 1
                    ? Colors.deepOrange
                    : Colors.orange.shade200;

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (status == 0) {
                    seatStatus[row][col] = 1;
                  } else if (status == 1) {
                    seatStatus[row][col] = 0;
                  }
                });
              },
              child: Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: fillColor,
                  border: Border.all(color: Colors.deepOrange, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget legendBox(String label, Color color, {bool border = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              border: border
                  ? Border.all(color: Colors.deepOrange, width: 1.5)
                  : null,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }

  Widget buildPlayerStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'البحث',
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
              filled: true,
              fillColor: Color(0xFFF4F4F4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: players.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final player = players[index];
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(player['image']!),
                            radius: 24,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(player['name']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 5),
                                  Image.asset(player['badge']!, height: 16),
                                ],
                              ),
                              Text(player['username']!,
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(player['description']!,
                            style: TextStyle(color: Color(0xff6A656E))),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            infoRow(
                                "assets/images/user.svg", player['gender']!),
                            infoRow("assets/images/location-06.svg",
                                player['location']!),
                            infoRow("assets/images/calendar-04.svg",
                                player['dob']!),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_currentStep < 4) setState(() => _currentStep++);
            }, // رابط للخطوة التالية
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('التالي'),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentStep() {
    String selectedMethod = 'apple';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text("المبلغ", style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w600)),
                Spacer(),
                Text("500", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          SizedBox(height: 24),

          // الموقع
          // الموقع
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Text("الموقع",
                        style: TextStyle(
                            color: Colors.deepOrange, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey.shade700, height: 24),
                Row(
                  children: [
                  
                   
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                     
                        Text("مكة المكرمة، حي الشوقية"),
                      ],
                    ), Spacer(),
                      Icon(Icons.edit, size: 20),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // طرق الدفع
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xfff8f8f8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("طريقة الدفع",
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.w600)),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade700, height: 24),
                RadioListTile<String>(
                  value: 'apple',
                  activeColor: AppColors.primaryColor,
                  groupValue: selectedMethod,
                  onChanged: (_) {},
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ابل باي"),
                      Row(
                        children: [
                          Text("•••• 0357 8420"),
                          SizedBox(width: 10),
                          Image.asset("assets/images/Frame 1171275020.png",
                              height: 24),
                        ],
                      ),
                    ],
                  ),
                ),
                RadioListTile<String>(
                  value: 'master',
                  activeColor: AppColors.primaryColor,
                  groupValue: selectedMethod,
                  onChanged: (_) {},
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ماستر كارد"),
                      Row(
                        children: [
                          Text("•••• 0738 4085"),
                          SizedBox(width: 10),
                          Image.asset("assets/images/Frame 1171275020-2.png",
                              height: 24),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text("إضافة وسيلة دفع"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),
          // الملخص
        Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Color(0xfff8f8f8),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("الإجمالي", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
      SizedBox(height: 12),

                Divider(color: Colors.white, height: 24, thickness: 2,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text("الملعب", style: TextStyle(fontSize: 16)),  Text("300 ﷼", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
         
        ],
      ),

      SizedBox(height: 12),

      // خط متقطع
      LayoutBuilder(
        builder: (context, constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = 8.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black),
                ),
              );
            }),
          );
        },
      ),

      SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("المجموع", style: TextStyle(fontSize: 16, color: Colors.deepOrange)), Text("300 ﷼", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16)),
         
        ],
      ),
    ],
  ),
),


          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
          );},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text("ادفع الآن"),
          )
        ],
      ),
    );
  }

  Widget buildStadiumStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Text("Apr, 2025",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                Icon(Icons.arrow_forward_ios_sharp),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28), // Rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height:
                          100, // Ensure this height is sufficient for ListView
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(
                          bottom: 0,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: cleanderList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      cleanderList[index].day.toString(),
                                      style: const TextStyle(
                                        color: Color(0xff6C737F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    if (index != 1)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cleanderList[index]
                                                .dateD
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (index == 1)
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                cleanderList[index]
                                                    .dateD
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            // Center(
                                            //   child: Text(
                                            //     cleanderList[index]
                                            //         .dateH
                                            //         .toString(),
                                            //     style: TextStyle(
                                            //       color: Colors
                                            //           .white
                                            //           ,
                                            //       fontSize: 14,
                                            //       fontWeight:
                                            //           FontWeight
                                            //               .bold,
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text("حدد الوقت", style: TextStyle(fontWeight: FontWeight.normal)),
          SizedBox(height: 10),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: List.generate(timeSlots.length, (i) {
                final selected = _selectedSlotIndex == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedSlotIndex = i),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: selected ? Colors.deepOrange : Colors.white,
                      border: Border.all(
                          color: selected
                              ? Colors.deepOrange
                              : Colors.grey.shade300),
                    ),
                    child: Text(
                      timeSlots[i],
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 24),
          Text("اختر الملعب", style: TextStyle(fontWeight: FontWeight.normal)),
          SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: stadiums.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, i) {
                final stadium = stadiums[i];
                final selected = i == _selectedStadiumIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedStadiumIndex = i),
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(
                        color:
                            selected ? Colors.deepOrange : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            stadium['image']!,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(stadium['title']!,
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                              Text(stadium['location']!,
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 8),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text("حجز",
                                      style: TextStyle(color: Colors.white)),
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
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_currentStep < 4) setState(() => _currentStep++);
            }, // رابط للخطوة التالية
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('التالي'),
          ),
        ],
      ),
    );
  }

  Widget infoRow(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, width: 16),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: Color(0xff6A656E))),
      ],
    );
  }

  Widget buildCustomStepper(int currentStep) {
    List<String> steps = ["المعلومات", "المنافسين", "الملاعب", "الدفع"];
    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          return Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 2,
                  color: (i - 1) ~/ 2 < currentStep
                      ? Colors.deepOrange
                      : Colors.grey[400],
                ),
              ),
            ),
          );
        } else {
          final index = i ~/ 2;
          final isActive = index == currentStep;
          final isDone = index < currentStep;
          return Column(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor:
                    isActive || isDone ? Colors.deepOrange : Colors.grey[400],
                child: Icon(
                  isDone
                      ? Icons.check
                      : (isActive ? Icons.directions_run : Icons.circle),
                  size: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                steps[index],
                style: TextStyle(
                  fontSize: 12,
                  color: isActive
                      ? Colors.black
                      : (isDone ? Colors.deepOrange : Colors.grey),
                ),
              )
            ],
          );
        }
      }),
    );
  }
}

class CleanderModel {
  final String? day;
  final String? dateD;
  final String? dateH;
  CleanderModel({this.day, this.dateD, this.dateH}) {}
}
