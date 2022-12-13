// ignore_for_file: prefer_const_constructors

import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/Splash%20Screens/splash_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';

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
            // kwidth20,
            /*   Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 8,
                ),
                Image.asset(
                  "assets/Untitled design (2).png", height: 100.h, width: 420.w,
                  //height: 100,
                ),
              ],
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
            kheight10,
            subHeading("Name"),
            textField("Enter Your Name"),
            kheight10,
            subHeading("E-Mail"),
            textField("Enter Your E-Mail"),
            kheight10,
            subHeading("Phone"),
            textField("Enter Your Phone Number"),
            kheight10,
            subHeading("Password"),
            textField("Enter Your Password"),
            kheight10,
            subHeading("Confirm-Password"),
            textField("Enter Your Password"),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Aleady Have An Account ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
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
