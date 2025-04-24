import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';
import 'package:narpion_app/shared/customButton.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<String> images = [
    'assets/images/Frame 1171274823.png',
    'assets/images/Image-2.png',
    'assets/images/Image-3.png',
    'assets/images/Group 1.png',
  ];
 late GoogleMapController _controller;
  late LatLng _center;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _center = LatLng(21.4225, 39.8262); // Example: coordinates for Mecca
    _markers = {
      Marker(
        markerId: MarkerId('marker_1'),
        position: _center,
        infoWindow: InfoWindow(title: 'Center Marker', snippet: 'This is the center'),
      ),
    };
  }

  // Callback for when the map is created
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  int currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
       leading: IconButton(
                    onPressed: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text(
            "تفاصيل المنافسة",
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
        
          children: [
            Container(
              height: 200, // Adjust the height to your design
              width: double.infinity,
              color: Colors
                  .grey.shade300, // Optional background color for visual effect
              child: Image.asset(
                images[currentImageIndex],
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            // Thumbnails Row
            SizedBox(
              height: 80, // Height for thumbnail container
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                itemCount: images.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  bool isSelected = index == currentImageIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0XFFF7F7F7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/shape.svg"),
                          const SizedBox(width: 5),
                          Text(
                            "الاحد  4 أبريل 2025 ",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Frame 1171274868.svg"),
                          const SizedBox(width: 5),
                          Text(
                            "06:00م",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Frame 1171274867.svg"),
                          const SizedBox(width: 5),
                          Text(
                            "بصمة الخيال , الشوقية مكة",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
        
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0XFFF7F7F7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              " وصف المنافسة ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "عن اللعبة\nلعبة البادل هي رياضة شيّقة تجمع بين التنس والاسكواش\n"
                              "وتُقام داخل ملعب محاط بجدران زجاجية تتيح استخدام الحوائط\n"
                              "كجزء من أسلوب اللعب.",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                height: 1.6, // line spacing
                                fontWeight: FontWeight.normal,
                              ),
                            ),
         SizedBox(height: 10),
        
                            Text(
                              " مدة المنافسة ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ), SizedBox(height: 5),
        
        
                            Text("	تستمر المنافسة  عادةً من 60 إلى 90 دقيقة ", textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                height: 1.6, // line spacing
                                fontWeight: FontWeight.normal,
                              ),),
        
                               SizedBox(height: 10),
        
                            Text(
                              "احتساب نقاط الفوز ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ), SizedBox(height: 5), Text(
        " تُحتسب النقاط (15، 30، 40، ثم نقطة الفوز).\n"
        "• يفوز الفريق بالمجموعة عند تحقيق 6 أشواط بفارق شوطين على الأقل.\n"
        "• تُحتسب المنافسة لصالح الفريق الذي يفوز بمجموعتين من أصل 3 مجموعات.",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 10,
         color: Colors.black,
          height: 1.6,
        )),SizedBox(height: 10),
        
                            Text(
                              " الموقع ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ), SizedBox(height: 5),
        ClipRRect(
           borderRadius: BorderRadius.circular(20), // Rounded corners
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              markers: _markers, // Adding the markers set
            ),)
          ),  SizedBox(height: 10),
                          ],
                        )))),
                          SizedBox(height: 30),              Padding(
                           padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                                  onTap: (){ 
                                      showJoinRequestDialog(context);

      //                               Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      // );
      
      },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.primaryColor
                                    ),
                                    child: Center(
                                      child:Text("انضم الان", style: TextStyle(color: Colors.white, fontSize: 14 , fontWeight: FontWeight.normal),)
                                    ),
                                  ),
                                ),
                          ), SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
void showJoinRequestDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // زر إغلاق
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 10),
              // العنوان
              Text(
                "إرسال الطلب",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // النص
              Text(
                "هل ترغب في إرسال طلب الانضمام إلى المنافسة؟\nسيتم إشعار المنظم سعد لقبول طلبك",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),

              // الأزرار
              Row(
                children: [
                  // زر إلغاء
               
                  // زر تأكيد
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );
                        // تنفيذ الإجراء
                        // Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(elevation: 0,
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text("تأكيد"),
                    ),
                  ),  const SizedBox(width: 12),   Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(elevation: 0,
                        foregroundColor: Colors.deepOrange,
                        side: BorderSide(color: Colors.deepOrange),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text("إلغاء"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
