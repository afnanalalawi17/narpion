import 'package:flutter/material.dart';
import 'package:narpion_app/shared/appColor.dart';

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          // centerTitle: true,
         ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Padding(
  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
           boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

SizedBox(height: 80,),
              Text(
                      'تم الدفع بنجاح',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                ),buildBarcode(),
                Container(
                  height: 60,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
                    SizedBox(height: 8),
                    Text('No : 12345678900000',
                        style: TextStyle(color: Colors.black)),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('الإجمالي',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),SizedBox(height: 20,),
                              Text('طريقة الدفع',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),SizedBox(height: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('424,982 SR',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),SizedBox(height: 20,),
                              Text('Master Card',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                         
                        ],
                      ),
                    ),
        
          
           
            SizedBox(height: 20),
          ],
        ),
      ),

      // الصورة في الأعلى
      Positioned(
        top: -88,
        right: 0,
        left: 0,
        child: Center(
          child: Image.asset(
            'assets/images/Successful Payment.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    ],
  ),
),

        
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PaymentSuccessScreen()), // غيّر NextScreen لشاشتك التالية
          );},
            child: Text('العودة الصفحة الرئيسية',
                style: TextStyle(fontSize: 16, color: Colors.white , fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }

  Widget buildBarcode() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(30, (index) {
          return Container(
            width: index % 5 == 0 ? 3 : 1.5,
            height: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 1),
            color: Colors.black,
          );
        }),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;
    double notchRadius = 10;
    Path path = Path();

    // Start top-left
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 2 - notchRadius);
    path.arcToPoint(Offset(0, size.height / 2 + notchRadius),
        radius: Radius.circular(notchRadius), clockwise: false);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2 + notchRadius);
    path.arcToPoint(Offset(size.width, size.height / 2 - notchRadius),
        radius: Radius.circular(notchRadius), clockwise: false);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}