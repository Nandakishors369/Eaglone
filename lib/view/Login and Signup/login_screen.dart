import 'dart:ui';

import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/password_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Lottie.asset('assets/registered.json', height: 340.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kwidth20,
              Text(
                "Login",
                style: GoogleFonts.poppins(textStyle: signupHeading),
              ),
            ],
          ),
          kheight20,
          subHeading("E-Mail"),
          textField("Enter Your E-Mail"),
          sizedBox15,
          subHeading("Password"),
          textField("Enter Your Password"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordScreen(),
                      ));
                },
                child: Text(
                  "Forgot Password ?",
                  style: GoogleFonts.karla(
                    //fontSize: 19.sp,
                    textStyle: TextStyle(color: themeGreen),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              )
            ],
          ),
          SizedBox(
            width: 270.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: themeGreen),
              child: Text(
                "Continue",
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "or",
                  style: GoogleFonts.karla(
                    fontSize: 19.sp,
                    textStyle: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 270.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                "Continue With Google",
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have An Account ?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: Text(
                    "Create Here",
                    style: GoogleFonts.karla(
                      textStyle: TextStyle(color: themeGreen),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
