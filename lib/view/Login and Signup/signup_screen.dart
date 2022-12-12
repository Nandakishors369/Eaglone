// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  Image.asset(
              "assets/Pink Red W Letter Animated Abstract Shape Tech Logo (5000 × 5000px) (1).png",
              height: 180,
            ), */
            //Lottie.asset('assets/38435-register (1).json', height: 180.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kwidth20,
                Text(
                  "Sign-Up",
                  style: GoogleFonts.poppins(textStyle: signupHeading),
                ),
              ],
            ),
            kheight20,
            subHeading("Name"),
            textField("Enter Your Name"),
            sizedBox15,
            subHeading("E-Mail"),
            textField("Enter Your E-Mail"),
            sizedBox15,
            subHeading("Phone"),
            textField("Enter Your Phone Number"),
            sizedBox15,
            subHeading("Password"),
            textField("Enter Your Password"),
            sizedBox15,
            subHeading("Confirm-Password"),
            textField("Enter Your Password"),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Aleady Have An Account ?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Click Here",
                      style: GoogleFonts.karla(
                        textStyle: TextStyle(color: themeGreen),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 270.w,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: themeGreen),
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
