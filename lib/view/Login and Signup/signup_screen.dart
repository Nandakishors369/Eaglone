// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/signup%20model/signup_model.dart';
import 'package:eaglone/services/firebase_auth_methods.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/ph_signup.dart';
import 'package:eaglone/view/Login%20and%20Signup/signupuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/Splash%20Screens/splash_screen.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cpasswordController = TextEditingController();
final sformGlobalKey = GlobalKey<FormState>();
final FirebaseAuth auth = FirebaseAuth.instance;

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: sformGlobalKey,
          child: SingleChildScrollView(
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
                Lottie.asset('assets/registered.json', height: 320.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kwidth20,
                    Text(
                      "Sign-Up with Email",
                      style: GoogleFonts.poppins(textStyle: signupHeading),
                    ),
                  ],
                ),
                kheight10,
                subHeading("Name"),
                textField(
                  hint: "Enter Your Name",
                  controller: nameController,
                  type: "Enter a Name of 12 Characters",
                  keyboard: TextInputType.name,
                ),
                kheight10,
                subHeading("E-Mail"),
                textField(
                  hint: "Enter Your Email",
                  controller: emailController,
                  type: "Enter a valid email",
                  keyboard: TextInputType.emailAddress,
                ),
                kheight10,
                /* subHeading("Phone"),
                textField(
                    hint: "Enter Your Phone Number",
                    controller: phoneController),
                kheight10, */
                subHeading("Password"),
                textField(
                  hint: "Enter Your Password",
                  controller: passwordController,
                  type: "Enter a Password atleast 6 characters",
                  keyboard: TextInputType.visiblePassword,
                ),
                /* kheight10,
                subHeading("Confirm-Password"),
                textField(
                    hint: "Enter Your Password",
                    controller: cpasswordController), */
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already A User"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
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
                    onPressed: () async {
                      final isValid = sformGlobalKey.currentState!.validate();
                      if (isValid) {
                        signUpUser();
                        createUser(
                          name: nameController.text,
                          email: emailController.text,
                          pass: passwordController.text,
                          //phone: phoneController.text,
                        );
                        /*  phoneSignIn(); */

                        nameController.clear();
                        emailController.clear();

                        passwordController.clear();
                        cpasswordController.clear();
                      }
                      await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: themeGreen),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  Future createUser({
    required String name,
    required String email,
    required String pass,
  }) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;

    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    final users = signupData(
      name: name,
      email: email,
      pass: pass,
      id: docUser.id,
      sId: uid,
    );

    final json = users.toJson();

    //create doc and write data to firebase

    await docUser.set(json);

    showSnackBar(context, 'its an exception');
  }

  /*  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text.trim());
  } */
}
