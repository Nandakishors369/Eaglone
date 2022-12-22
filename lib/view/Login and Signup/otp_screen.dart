import 'dart:ui';

import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  TextEditingController codeController;
  VoidCallback onPressed;
  OtpScreen({
    super.key,
    required this.codeController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("assets/105173-verification-code-otp.json"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                kwidth20,
                Text(
                  "Enter OTP",
                  style: GoogleFonts.poppins(textStyle: signupHeading),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: [
                  Text(
                    'A four digit OTP has been sent to your phone number\n +91 9074973331',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 15.sp)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Pinput(
              controller: codeController,
              length: 6,
              defaultPinTheme: PinTheme(
                width: 56.w,
                height: 56.h,
                textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginUserScreen(),
                    ));
              },
              child: Text(
                "Resend OTP",
                style: GoogleFonts.karla(
                  textStyle: TextStyle(fontSize: 17.sp, color: themeGreen),
                ),
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                "ok",
                style: GoogleFonts.karla(
                  textStyle: TextStyle(fontSize: 17.sp, color: themeGreen),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
