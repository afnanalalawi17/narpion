import 'package:flutter/material.dart';
import 'package:narpion_app/naroAI.dart';
import 'package:narpion_app/shared/appColor.dart';

class StartChatAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
      appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                title: const Text(
                "NARO AI",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                      "assets/images/Ellipse 7.png", height: 200,width: 200,fit: BoxFit.fill,),
              ),
             
              SizedBox(height: 20),
              Text(
                "تحدث مع ناريون مساعدك الرياضي !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Text(
                'احصل على إجابات لأسئلتك، يرشح لك أفضلا...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),  SizedBox(height: 20), Text(
                "المنافسين والمرافق الرياضية، أنشئ منافسة وغيره",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 40),
              
              SizedBox(  
      height: 50, // Set your desired height
      width: 300, // Set your desired width
    
                child: ElevatedButton(
                  onPressed: () {Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NaroAIScreen()), // غيّر NextScreen لشاشتك التالية
      );},
                  style: ElevatedButton.styleFrom(elevation: 0,
                    backgroundColor: Colors.deepOrange,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'ابدأ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
