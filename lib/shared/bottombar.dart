// ====== واجهة الناف بار ======
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/home.dart';
import 'package:narpion_app/profile.dart';
import 'package:narpion_app/ranking.dart';
import 'package:narpion_app/search.dart';
import 'package:narpion_app/stepper.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _currentIndex = 0;

  final List<String> icons = [
    'assets/images/home-01.png',
    'assets/images/excplor1.png',
    'assets/images/hugeicons_versus1.png',
    'assets/images/cart1.png',
    'assets/images/account1.png',
  ];

  final List<Widget> _screens = [
    HomeScreen(),
    SeachView(),
    HomeScreen(),
    RankingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == _currentIndex;

            return GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSelected)
                    CustomPaint(
                      painter: TrianglePainter(color: Colors.deepOrange),
                      child: SizedBox(height: 30, width: 50), // ⬅️ حجم المثلث
                    ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(6),
                    child: Image.asset(
                      icons[index],
                      //  width: 40,
                      // height: 40,
                      fit: BoxFit.fill, // أو BoxFit.scaleDown
                      color:
                          isSelected ? Colors.deepOrange : Colors.grey.shade600,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // رسم المثلث (السهم السفلي)
    final path = Path()
      ..moveTo(0, 0) // يسار القاعدة
      ..lineTo(size.width / 2, size.height) // رأس المثلث
      ..lineTo(size.width, 0) // يمين القاعدة
      ..close();

    canvas.drawPath(path, paint);

    // رسم دائرة صغيرة في منتصف المثلث (منتصف الطول والعرض تقريباً)
    final circlePaint = Paint()..color = Colors.white;
    final circleRadius = 4.0;

    canvas.drawCircle(
      Offset(size.width / 2, size.height * 0.5), // منتصف المثلث تقريباً
      circleRadius,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
