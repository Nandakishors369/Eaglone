// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/signup%20model/signup_model.dart';
import 'package:eaglone/services/firebase_auth_methods.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/ph_signup.dart';
import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/Splash%20Screens/splash_screen.dart';
import 'package:eaglone/view/const.dart';
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
                //Lottie.asset('assets/38435-register (1).json', height: 180.h),
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
                textField(hint: "Enter Your Name", controller: nameController),
                kheight10,
                subHeading("E-Mail"),
                textField(
                    hint: "Enter Your Email", controller: emailController),
                kheight10,
                subHeading("Phone"),
                textField(
                    hint: "Enter Your Phone Number",
                    controller: phoneController),
                kheight10,
                subHeading("Password"),
                textField(
                    hint: "Enter Your Password",
                    controller: passwordController),
                kheight10,
                subHeading("Confirm-Password"),
                textField(
                    hint: "Enter Your Password",
                    controller: cpasswordController),
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
                                builder: (context) => LoginUserScreen(),
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
                          phone: phoneController.text,
                        );
                        phoneSignIn();

                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        passwordController.clear();
                        cpasswordController.clear();
                      }
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

  Future createUser(
      {required String name,
      required String email,
      required String pass,
      required String phone}) async {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final users = signupData(
      name: name,
      email: email,
      pass: pass,
      phone: phone,
      id: docUser.id,
      sId: uid,
    );
    /*  final json = {
      'name': name,
      'age': 18,
    }; */
    final json = users.toJson();

    //create doc and write data to firebase
    await docUser.set(json);
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text.trim());
  }
}
