import 'package:flutter/material.dart';

class SelectSportSheet extends StatefulWidget {
  @override
  _SelectSportSheetState createState() => _SelectSportSheetState();
}

class _SelectSportSheetState extends State<SelectSportSheet> {
  final List<Map<String, String>> sports = [
    {"name": "الجولف", "icon": "🏌️‍♂️"},
    {"name": "الريشة الطائرة", "icon": "🏸"},
    {"name": "البادل", "icon": "🎾"},
    {"name": "تنس الطاولة", "icon": "🏓"},
    {"name": "الشطرنج", "icon": "♟️"},
    {"name": "كرة السرعة", "icon": "🕹️"},
    {"name": "الرماية", "icon": "🏹"},
    {"name": "كرة المضرب", "icon": "⚾"},
    {"name": "كرة البلياردو", "icon": "🎱"},
    {"name": "كرة الهواء", "icon": "🎈"},
    {"name": "البولينج", "icon": "🎳"},
  ];

  Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      builder: (_, controller) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('اختر رياضتك المفضلة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),

            // حقل البحث
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'بحث',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),

            // شبكة الرياضات
            Expanded(
              child: GridView.count(
                controller: controller,
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: sports.map((sport) {
                  final isSelected = selected.contains(sport['name']);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected)
                          selected.remove(sport['name']);
                        else
                          selected.add(sport['name']!);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.deepOrange.shade50 : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        border: Border.all(
                          color: isSelected ? Colors.deepOrange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(sport['icon']!, style: TextStyle(fontSize: 24)),
                          SizedBox(height: 6),
                          Text(
                            sport['name']!,
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // أزرار أسفل
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("مسح الكل", style: TextStyle(color: Colors.grey)),
                    onPressed: () {
                      setState(() {
                        selected.clear();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 0,
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("تطبيق"),
                    onPressed: () {
                      print("Selected sports: $selected");
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
