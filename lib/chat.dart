import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/shared/bottombar.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(     leading: IconButton(
                    onPressed: () {  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          backgroundColor: Colors.deepOrange,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=4'), // Add your image
              ),
              SizedBox(width: 8),
              Text('مجد'),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Center(
                child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0XFFF2F2F2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('الاثنين، ٢ إبريل')))),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  // Message from the other user
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 50, left: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'مستعد نبدأ تحدي جديد؟',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            margin: EdgeInsets.only(right: 50, left: 10),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              '10:11 ص',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12),
                            )),
                      ),
                    ],
                  ),

                  // Message from you
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 50),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'أكيد!',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, left: 50),
                            padding: EdgeInsets.all(12),
                            child: Text(
                              '10:12 ص',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'اكتب رسالتك',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                  hintTextDirection: TextDirection.rtl,
                 suffixIcon: Icon(
                    Icons.mic_none_rounded,
                    color: Colors.grey,
                    size: 33,
                  ),

                  prefixIcon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                    size: 33,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color(0XFFF2F2F2),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
