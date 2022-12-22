import 'package:firebase_auth/firebase_auth.dart';

class signupData {
  String name;
  String email;
  String phone;
  String pass;
  String id;
  String sId;

  signupData(
      {this.id = '',
      required this.name,
      required this.email,
      required this.pass,
      required this.phone,
      required this.sId});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'pass': pass,
        'sId': sId
      };

  static signupData fromJson(Map<String, dynamic> json) => signupData(
        name: json['name'],
        email: json['email'],
        pass: json['pass'],
        phone: json['phone'],
        sId: json['sId'],
      );
}
