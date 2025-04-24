import 'package:flutter/material.dart';
import 'package:narpion_app/chat.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';
import 'package:narpion_app/startChatAI.dart';

class ChatListView extends StatelessWidget {
  final List<ChatUser> users = [
    ChatUser(name: 'مجد', lastMessage: 'نبدأ تحدي؟', image: 'https://i.pravatar.cc/150?img=4', unreadCount: 1, isOnline: true),
    ChatUser(name: 'سعد', lastMessage: 'نبدأ تحدي؟', image: 'https://i.pravatar.cc/150?img=1', unreadCount: 6, isOnline: true),
    ChatUser(name: 'غدير', lastMessage: 'نبدأ تحدي؟', image: 'https://i.pravatar.cc/150?img=3', unreadCount: 2, isOnline: true),
    ChatUser(name: 'عمار', lastMessage: 'نبدأ تحدي؟', image: 'https://i.pravatar.cc/150?img=2', unreadCount: 3, isOnline: true),
  ];

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                title: const Text(
                "المحادثات",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add_comment),
        onPressed: () {},
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                hintText: "البحث",
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
                                    vertical: 6, horizontal: 20),
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
               IconButton(onPressed: () {}, icon: Icon(Icons.settings , color: Color(0xFFD4D4D4),)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: GestureDetector(onTap: () {
                      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()), // غيّر NextScreen لشاشتك التالية
      );
                  },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: index == 0 ? Colors.deepOrange : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(user.image),
                            ),
                            if (user.isOnline)
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                          ],
                        ),
                        title: Text(user.name, textAlign: TextAlign.right),
                        subtitle: Text(user.lastMessage, textAlign: TextAlign.right),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('9:55 Am', style: TextStyle(fontSize: 12)),
                            SizedBox(height: 4),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.green,
                              child: Text(
                                user.unreadCount.toString(),
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatUser {
  final String name;
  final String lastMessage;
  final String image;
  final int unreadCount;
  final bool isOnline;

  ChatUser({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.unreadCount,
    required this.isOnline,
  });
}
