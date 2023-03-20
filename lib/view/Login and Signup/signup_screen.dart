// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:eaglone/services/user_authenticaton.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/widgets/common_widgets.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
//final FirebaseAuth auth = FirebaseAuth.instance;
final UserAuth userAuth = UserAuth();

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
                Lottie.asset('assets/registered.json', height: 290.h),
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
                    type: "Enter a Name of atleas 3 Characters",
                    keyboard: TextInputType.name,
                    len: 3),
                kheight10,
                subHeading("E-Mail"),
                textField(
                    hint: "Enter Your Email",
                    controller: emailController,
                    type: "Enter a valid email",
                    keyboard: TextInputType.emailAddress,
                    len: 5),
                kheight10,
                subHeading("Phone"),
                textField(
                    hint: "Enter Your Phone Number",
                    controller: phoneController,
                    keyboard: TextInputType.phone,
                    len: 10,
                    type: "Enter a valid number"),
                kheight10,
                subHeading("Password"),
                ptextField(
                  hint: "Enter Your Password",
                  controller: passwordController,
                  type: "Enter a Password atleast 6 characters",
                  keyboard: TextInputType.visiblePassword,
                ),
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
                        FutureBuilder(
                          future: userAuth.signup(
                              name: nameController.text,
                              email: emailController.text,
                              mobile: phoneController.text,
                              password: passwordController.text),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CupertinoActivityIndicator(
                                      color: kblack,
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasData) {
                              if (snapshot.data!.success == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                          email: emailController.text),
                                    ));
                              } else {
                                log("log from signupscreen - failedd");
                              }
                            } else {
                              return Text("");
                            }
                            return SizedBox.shrink();
                          },
                        );
                        /*      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CupertinoActivityIndicator(
                                color: kblack,
                              ),
                            );
                          },
                        );
                        await signUpUser();
                        log("signup");
                        /*       await createUser(
                            name: nameController.text,
                            email: emailController.text,
                            pass: passwordController.text,
                            context: context); */
                        log("data sent");

                        /*  phoneSignIn(); */

                        if (userAuth.status != true) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Something Went Wrong"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OtpScreen(email: emailController.text),
                              ));
                        } */
                      }
                      // emailController.clear();
                      nameController.clear();
                      passwordController.clear();
                      cpasswordController.clear();
                      phoneController.clear();
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

  Future signUpUser() async {
    await userAuth.signup(
        name: nameController.text,
        email: emailController.text,
        mobile: phoneController.text,
        password: passwordController.text);
  }

  /*  Future createUser(
      {String? name,
      required String email,
      required String pass,
      required BuildContext context}) async {
    final User? user = auth.currentUser;
    String uid = user!.uid;

    final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
    /* final users = signupData(
      name: name,
      email: email,
      pass: pass,
      id: docUser.id,
      sId: uid,
    ); */

    final json = users.toJson();

    //create doc and write data to firebase

    await docUser.set(json);

    //showSnackBar(context, 'its an exception');
  }


  /*  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text.trim());
  } */
}
 */
}
