import 'package:flutter/material.dart';
import 'package:narpion_app/boarding.dart';
import 'package:narpion_app/login.dart';
import 'package:narpion_app/register.dart';
class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingView()), // غيّر NextScreen لشاشتك التالية
      );
    });
  }

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
          width: 304,
          height: 521,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
