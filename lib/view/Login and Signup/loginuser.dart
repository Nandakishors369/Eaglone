import 'dart:developer';

import 'package:eaglone/services/user_authenticaton.dart';
import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserScreen extends StatefulWidget {
  LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  UserAuth userAuth = UserAuth();

  bool auth = false;

  Future checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getString('token').toString());
    if (prefs.getString('token') != null) {
      auth = true;
      log(auth.toString());
      return auth;
    }
    return auth;
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LoginScreen(); //nav barrrr
            } else {
              return LoginScreen();
            }
          }),
=======
      body: /* auth ? NavigationBarScreen() : const LoginScreen(), */

          FutureBuilder(
              future: checkLogin(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return NavigationBarScreen(); //nav barr
                } else {
                  return LoginScreen();
                }
              }),
>>>>>>> authentication
    );
  }
}
 
  /* Future gotoHome(BuildContext context) async {
    Timer(const Duration(seconds: 4), (() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }));
  }
} */


/* 
 if (snapshot.hasData) {
              return NavigationBarScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something Went wrong'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(
                  color: kblack,
                ),
              );
            } else {
              return LoginScreen();
            } */