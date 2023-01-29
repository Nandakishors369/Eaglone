import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/main.dart';
import 'package:eaglone/model/free_courses.dart';
import 'package:eaglone/view/Home%20Screen/home_screen.dart';
import 'package:eaglone/view/Login%20and%20Signup/loginuser.dart';
import 'package:eaglone/view/Login%20and%20Signup/otp_screen.dart';
import 'package:eaglone/view/Navigation/navigation_bar.dart';
import 'package:eaglone/view/const.dart';
import 'package:eaglone/view/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CupertinoActivityIndicator(
          color: kblack,
        ),
      ),
    );
    try {
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationBarScreen(),
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future<void> signout(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then(
          (value) => showSnackBar(context, "Email has been Sent"),
        )
        .catchError((error) {
      log('Error send passwoed = $error');
    });
  }

  //phone sign in
  /* Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    TextEditingController codeController = TextEditingController();
    String _verificationId = '';
    int? _resendToken;
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91${phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          _verificationId = verificationId;
          _resendToken = resendToken;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                codeController: codeController,
                onPressed: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim(),
                  );
                  await _auth.signInWithCredential(credential);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginUserScreen(),
                    ),
                  );
                },
              ),
            ),
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = _verificationId;
        },
        forceResendingToken: _resendToken,
        timeout: const Duration(seconds: 10));
  } */
}

/* Future<List<ProductModel>> getAllProducts() async {
  final snapshot =
      await FirebaseFirestore.instance.collection('freeCourses').get();
  final productData =
      snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
  log("all produictss");
  //log(productData.toString());
  return productData;
} */
