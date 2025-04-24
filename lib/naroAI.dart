
import 'package:flutter/material.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';

class NaroAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("NARO AI")),
         elevation: 0,
       leading: IconButton(
                    onPressed: () { Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 200),
          Center(
                child: Image.asset(
                      "assets/images/Ellipse 7.png", height: 80,width: 80,fit: BoxFit.fill,),
              ), SizedBox(height: 300),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                buildOption(context, "أنشئ لي تحدي جديد اليوم", () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedCompetitorPage()),
                  );}),
                buildOption(context, "كيف مستواي هذا الشهر؟", () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedCompetitorPage()),
                  );}),
                buildOption(context, "أقرب ملعب بادل؟", () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedCompetitorPage()),
                  );}),
                buildOption(context, "رشح لي منافس بنفس مستواي", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuggestedCompetitorPage()),
                  );
                }),
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
                 prefixIcon: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Image.asset("assets/images/text+ add.png", height: 10 ,width: 10,fit: BoxFit.fill,),
                 ),

                  suffixIcon: Icon(
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
        ],
      ),
    );
  }

  Widget buildOption(BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}

class SuggestedCompetitorPage extends StatelessWidget {
  final List<Map<String, dynamic>> competitors = [
    {"name": "سعيد عبدالله", "rank": 4, "xp": 300, "image": "https://i.pravatar.cc/150?img=4"},
    {"name": "سلمان سليم", "rank": 5, "xp": 275, "image": "https://i.pravatar.cc/150?img=2"},
    {"name": "عبدالحميد سالم", "rank": 6, "xp": 263, "image": "https://i.pravatar.cc/150?img=3"},
    {"name": "هشام محمد", "rank": 7, "xp": 230, "image": "https://i.pravatar.cc/150?img=8"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(  elevation: 0,
       leading: IconButton(
                    onPressed: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("NARO AI",  style: TextStyle(fontWeight: FontWeight.w400),)),
       
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              // Chat bubble
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
                    radius: 20,
                  ), SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("رشح لي أفضل المنافسين رياضة بادل"),
                    ),
                  ),
                 
                 
                ],
              ),
              const SizedBox(height: 30),

              // Circle gradient image + text
              Row(
                children: [
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     gradient: LinearGradient(
                  //       colors: [Colors.red, Colors.purple, Colors.blue],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("إليك أفضل المنافسين على حسب مستواك"),
                        Text(
                          "كن حذرًا في منافستهم، فإنهم أقوياء",
                          // style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ), Center(
                child: Image.asset(
                      "assets/images/Ellipse 7.png", height: 40,width: 40,fit: BoxFit.fill,),
              ),
                ],
              ),
              const SizedBox(height: 20),

              // Table header
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey
              ),
                
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                   Text("التصنيف"), Text("اللاعب"),  Text("النقاط"),
                   
                   
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Competitors list
              ...competitors.map((user) => buildUserRow(user)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserRow(Map<String, dynamic> user) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             
          Row(
            children: [ Text("${user['rank']}"), SizedBox(width: 8),
             CircleAvatar(
                backgroundImage: NetworkImage(user['image']),
                radius: 16,
              ), SizedBox(width: 8),  Text(user['name']),
             
             
            ],
          ),
     Text("${user['xp']} XP", style: TextStyle(fontWeight: FontWeight.normal,color: Color(0xff6A656E))),
        ],
      ),
    );
  }
  Widget buildChatBar() {
    return   Padding(
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
                 prefixIcon: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Image.asset("assets/images/text+ add.png", height: 10 ,width: 10,fit: BoxFit.fill,),
                 ),

                  suffixIcon: Icon(
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
            );
  }
}