import 'package:eaglone/view/Login%20and%20Signup/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LoginScreen(); //nav barr
            } else {
              return LoginScreen();
            }
          }),
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