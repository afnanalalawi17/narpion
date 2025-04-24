import 'package:flutter/material.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';

class NotificationSettingsView extends StatefulWidget {
  @override
  _NotificationSettingsViewState createState() => _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  final List<NotificationSetting> settings = [
    NotificationSetting(title: 'قبول التحدي', subtitle: 'ستصلك إشعارات عند قبول أي شخص للتحدي الذي أرسلته', isEnabled: true),
    NotificationSetting(title: 'طلب تحدي', subtitle: 'ستتلقى إشعاراً عندما يطلب أحدهم الدخول في تحدي معك', isEnabled: true),
    NotificationSetting(title: 'دعوة لتحدي', subtitle: 'سيتم إعلامك إذا تمت إضافتك إلى أحد التحديات', isEnabled: true),
    NotificationSetting(title: 'تنبيه بتحدي قادم', subtitle: 'سوف نرسل لك إشعاراً عند اقتراب موعد بدء أحد التحديات.', isEnabled: true),
    NotificationSetting(title: 'الفعاليات الرياضية', subtitle: 'ستصلك تنبيهات عند توفر فعاليات رياضية جديدة', isEnabled: true),
    NotificationSetting(title: 'متابع جديد', subtitle: 'سيتم إشعارك عندما يبدأ شخص ما بمتابعتك', isEnabled: false),
  ];

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(leading: IconButton(
                    onPressed: () {  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
               
                title: const Text(
                'اعدادات الاشعارات',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 30,),
            Text(
              'يمكنك تفعيل أو إيقاف التنبيهات حسب تفضيلاتك:',
              style: TextStyle(fontSize: 16 , fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 16), Divider(
                            thickness: 1,
                            color: Color(0xFFD4D4D4),
                            indent: 10,
                          ),      SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: settings.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final item = settings[index];
                  return Column(
                    children: [
                      ListTile(
                        trailing: Icon(
                          item.isEnabled ? Icons.check_circle : Icons.circle,
                          color: item.isEnabled ? Colors.deepOrange : Colors.grey.shade400,size: 33,
                        ),
                        title: Text(item.title, style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(item.subtitle, style: TextStyle(fontWeight: FontWeight.normal)),
                        onTap: () {
                          setState(() {
                            item.isEnabled = !item.isEnabled;
                          });
                        },
                      ),Divider(
                            thickness: 1,
                            color: Color(0xFFD4D4D4),
                            indent: 10,
                          ),   
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSetting {
  String title;
  String subtitle;
  bool isEnabled;

  NotificationSetting({
    required this.title,
    required this.subtitle,
    this.isEnabled = false,
  });
}
