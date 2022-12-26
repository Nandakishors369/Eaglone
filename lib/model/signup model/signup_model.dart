import 'package:firebase_auth/firebase_auth.dart';

class signupData {
  String? name;
  String? email;

  String? pass;
  String id;
  String sId;

  signupData(
      {this.id = '', this.name, this.email, this.pass, required this.sId});

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'email': email, 'pass': pass, 'sId': sId};

  static signupData fromJson(Map<String, dynamic> json) => signupData(
        name: json['name'],
        email: json['email'],
        pass: json['pass'],
        sId: json['sId'],
      );
}
