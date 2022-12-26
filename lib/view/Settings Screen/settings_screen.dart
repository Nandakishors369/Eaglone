import 'dart:ui';

import 'package:eaglone/services/firebase_auth_methods.dart';
import 'package:eaglone/view/Login%20and%20Signup/google_login.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/widgets/common_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheigh20,
            Row(
              children: [
                kwidth15,
                appHeadings(content: "Settings"),
              ],
            ),
            kheigh20,
            headingss(heading: "Edit Profile"),
            kheigh20,
            headingss(heading: "Course History"),
            kheigh20,
            headingss(heading: "Order History"),
            kheigh20,
            headingss(heading: "Address"),
            kheigh20,
            headingss(heading: "Wallet"),
            kheigh20,
            headingss(heading: "App Settings"),
            kheigh20,
            InkWell(
                onTap: () {
                  googleSignIn.signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: headingss(heading: "Logout")),
            /*  ElevatedButton(
                onPressed: () {
                  
                  //logoutUser(context: context);
                },
                child: Text("Logout")) */
          ],
        ),
      )),
    );
  }

  SizedBox headingss({required String heading}) {
    return SizedBox(
      height: 60,
      width: 400,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            kwidth15,
            Text(
              "$heading",
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        elevation: 10,
      ),
    );
  }

  void logoutUser({required BuildContext context}) {
    FirebaseAuthMethods(FirebaseAuth.instance).signout(context);
  }
}
