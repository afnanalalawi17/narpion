import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/notificationSetting.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // يبدأ على تبويب "تحديات"
    _tabController = TabController(length: 4, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildNotificationBox({
    required String title,
    required String subtitle,
    required String timeAgo,
    required String imageUrl,
    bool hasActions = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0XFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: [ Icon(Icons.circle, size: 10, color: Colors.deepOrange),   const SizedBox(width: 8),
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                const SizedBox(height: 4),   Text(timeAgo,
                    style: const TextStyle(color: Colors.red, fontSize: 12)),
                 const SizedBox(height: 4), Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              
             
                if (hasActions) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                              shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
                            backgroundColor: Colors.deepOrange,
                          ),
                          child: const Text("قبول",style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom( elevation: 0,  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("رفض",style:
                        const TextStyle(fontWeight: FontWeight.normal, fontSize: 16)),
                        ),
                      ),
                    ],
                  )
                ]
              ],
            ),
          ),
        
         
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    // final tabStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

    return  
    DefaultTabController(
        length: 4,
        child: Scaffold(
      appBar: AppBar(     leading: IconButton(
                    onPressed: () {  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                centerTitle: true, actions: [
          IconButton(onPressed: () { Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NotificationSettingsView()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.settings)),
        ],
               
                title: const Text(
                 "الاشعارات",
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
      // // backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrange,
      //   title:  Text('الإشعارات'),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      //   ],
      //   leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
      //   bottom: TabBar(
      //     controller: _tabController,
      //     indicatorColor: Colors.white,
      //     tabs: const [
      //       Tab(text: 'الكل'),
      //       Tab(text: 'حدث'),
      //       Tab(text: 'تحديات'),
      //       Tab(text: 'فعاليات'),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [  SizedBox(
                  height: 20,
                ),Padding(
                            padding: const EdgeInsets.only(right: 2, left: 2),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0XFFF2F2F2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Set the background color here
                              //  color: Color(0XFF384250).withOpacity(.3), // or any color you prefer
                              child: TabBar(labelStyle: TextStyle(fontWeight: FontWeight.normal ,  fontFamily: "Rubik",),
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
                                 
                                  Tab(text: 'الكل'),
              Tab(text: 'حدث'),
              Tab(text: 'تحديات'),
              Tab(text: 'فعاليات'),
                                ],
                              ),
                            ),
                          ), SizedBox(
                  height: 10,
                ),
            Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  buildTabContent('الكل'),
                  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset("assets/images/Illustration.svg"),
          SizedBox(height: 12), Text(
           "ماعندك أي اشعارات حاليًا ",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(height: 12),
          Text(
           "ابدأ بحجز  أو انضم لتحدي، و بيوصل لك كل جديد هنا.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    ),
                  // buildTabContent('حدث'),
                  buildTabContent('تحديات'),
                  buildTabContent('فعاليات'),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildTabContent(String tabName) {
    
    return ListView(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("اليوم",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
        ),
        buildNotificationBox(
          title: "مجد دعتك إلى تحدي جديد",
          subtitle: "تمت دعوتك إلى تحدي بادل",
          timeAgo: "قبل ٣ دقائق",
          imageUrl:
              "https://i.pravatar.cc/150?img=1", // صورة عشوائية فقط كـ مثال
          hasActions: true,
        ),
        buildNotificationBox(
          title: "تمت دعوتك إلى تحدي",
          subtitle: "مجد دعتك إلى تحدي جديد",
          timeAgo: "قبل ٣ دقائق",
          imageUrl: "https://i.pravatar.cc/150?img=2",
        ),
        buildNotificationBox(
          title: "تمت دعوتك إلى تحدي",
          subtitle: "غدير دعتك إلى تحدي جديد",
          timeAgo: "قبل ٣ دقائق",
          imageUrl: "https://i.pravatar.cc/150?img=3",
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("هذا الأسبوع",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
        ),
        buildNotificationBox(
          title: "تمت دعوتك إلى تحدي",
          subtitle: "سعد دعاك إلى تحدي جديد",
          timeAgo: "2025/4/14 - الإثنين",
          imageUrl: "https://i.pravatar.cc/150?img=4",
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
