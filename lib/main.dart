import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:narpion_app/boarding.dart';
import 'package:narpion_app/chat.dart';
import 'package:narpion_app/chatList.dart';
import 'package:narpion_app/details.dart';
import 'package:narpion_app/home.dart';
import 'package:narpion_app/login.dart';
import 'package:narpion_app/naroAI.dart';
import 'package:narpion_app/notification.dart';
import 'package:narpion_app/notificationSetting.dart';
import 'package:narpion_app/paymentSucess.dart';
import 'package:narpion_app/profile.dart';
import 'package:narpion_app/ranking.dart';
import 'package:narpion_app/register.dart';
import 'package:narpion_app/search.dart';
import 'package:narpion_app/shared/bottombar.dart';
import 'package:narpion_app/splash.dart';
import 'package:narpion_app/startChatAI.dart';
import 'package:narpion_app/stepper.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        fontFamily: "Rubik",
        useMaterial3: false,
        primaryColor: Color(0XFFCCA750),
        canvasColor: Colors.white,
        dividerColor: Colors.transparent),
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en'), Locale('ar'), Locale('ur')],
    home: SplashView(),
    locale: const Locale('ar'),
    fallbackLocale: const Locale('ar'),
    getPages: [
      GetPage(name: '/SplashView', page: () => SplashView()),
      GetPage(name: '/OnboardingView', page: () => OnboardingView()),
      GetPage(name: '/ChatScreen', page: () => ChatScreen()),
      GetPage(name: '/ChatListView', page: () => ChatListView()),
     
      GetPage(name: '/DetailsScreen', page: () => DetailsScreen()),
      GetPage(name: '/HomeScreen', page: () => HomeScreen()),
      GetPage(name: '/LoginScreen', page: () => LoginScreen()),
      GetPage(name: '/NotificationsView', page: () => NotificationsView()),
      GetPage(
          name: '/NotificationSettingsView',
          page: () => NotificationSettingsView()),
      GetPage(
          name: '/PaymentSuccessScreen', page: () => PaymentSuccessScreen()),
      GetPage(name: '/ProfileScreen', page: () => ProfileScreen()),
      GetPage(name: '/RankingScreen', page: () => RankingScreen()),
      GetPage(name: '/RegisterScreen', page: () => RegisterScreen()),
      GetPage(name: '/SeachView', page: () => SeachView()),
      GetPage(name: '/StartChatAIScreen', page: () => StartChatAIScreen()),
      GetPage(name: '/CompetitionStepper', page: () => CompetitionStepper()),
    ],
  ));
}
