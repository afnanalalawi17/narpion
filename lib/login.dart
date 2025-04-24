import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narpion_app/register.dart';
import 'package:narpion_app/shared/appColor.dart';
import 'package:narpion_app/shared/bottombar.dart';
import 'package:narpion_app/shared/customButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                      child: SvgPicture.asset(
                        'assets/images/Frame 36710.svg', // Replace with your logo path
                        height: 100,
                      ),
                    ),const SizedBox(height: 40),
                    Center(child: Text("تسجيل الدخول ", style: TextStyle(fontWeight: FontWeight.w600,fontSize:20)),),
                    const SizedBox(height: 80),
                 
                    TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle( color: AppColors.accentColor)
                  ,
                        hintText: 'البريد الالكتروني',
                        contentPadding: EdgeInsets.all(10),
                        // prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(
                                0xFFD4D4D4), // ✅ Light gray border like CSS
                            width: 1, // ✅ Matches "1px"
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color:
                                Color(0xFFD4D4D4), // Optional: darker on focus
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'كلمة المرور',
   hintStyle: TextStyle( color: AppColors.accentColor)
                  ,
                        contentPadding: EdgeInsets.all(10),
                        // prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(
                                0xFFD4D4D4), // ✅ Light gray border like CSS
                            width: 1, // ✅ Matches "1px"
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color:
                                Color(0xFFD4D4D4), // Optional: darker on focus
                            width: 1.5,
                          ),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility,
                            color: Color(
                                0xFFD4D4D4) ,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() => rememberMe = value!);
                              },
                            ),
                            const Text("تذكرني"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Forgot password action
                          },
                          child: const Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      text: 'تسجيل الدخول',
                      onPressed: () {
                         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNav()), // غيّر NextScreen لشاشتك التالية
      );
                        // Your login logic
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(
                                0xFFD4D4D4), // light gray, or AppColors.borderGray
                            endIndent: 10,
                          ),
                        ),
                        const Text(
                          "أو سجل الدخول عبر",
                          style: TextStyle(color: AppColors.accentColor),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFFD4D4D4),
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Google Button inside a circle
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .white, // You can set any background color
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     blurRadius: 5,
                            //     spreadRadius: 1,
                            //   ),
                            // ],
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/Google logo.svg'), // Google icon
                            iconSize: 36,
                            onPressed: () {
                              // Google login
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Apple Button inside a circle
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .white, // You can set any background color
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.2),
                            //     blurRadius: 5,
                            //     spreadRadius: 1,
                            //   ),
                            // ],
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/apple logo .svg'), // Apple icon
                            onPressed: () {
                              // Apple login
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ليس لديك حساب؟",
                  style: TextStyle(color: AppColors.accentColor),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()), // غيّر NextScreen لشاشتك التالية
      );
                    // Create account
                  },
                  child: const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
