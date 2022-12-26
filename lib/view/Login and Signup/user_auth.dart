import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaglone/model/signup%20model/signup_model.dart';
import 'package:eaglone/view/Login%20and%20Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

/* class UserAuth extends StatelessWidget {
  var ids;
  UserAuth({super.key, required this.ids});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<signupData?>(
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("went wrong");
            } else if (snapshot.hasData) {
              final datat = snapshot.data;

              return datat == null
                  ? Center(
                      child: Text('No user'),
                    )
                  : buildUser(datat);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Future<signupData?> readUser() async {
    //get signle documnet by ID
    final docUser = FirebaseFirestore.instance.collection('users').doc(ids);
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return signupData.fromJson(snapshot.data()!);
    }
  }

 /*  Widget buildUser(signupData datas) => ListTile(
        title: Text(datas.phone),
      ); */
}
 */