import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/model/signup%20model/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  bool verified = false;
  bool otpTrue = false;
  bool status = false;
  bool gotToken = false;

  String baseUrl = "https://eaglone-api.onrender.com/user-signup";

  Future<SignupResponse?> signup(
      {required String name,
      required String email,
      required String mobile,
      required String password}) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "mobile": mobile,
        "name": name
      };
      Map<String, String> headers = {
        "apikey":
            "bearer \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
      };
      final url = Uri.parse(baseUrl);
      http.Response response;
      log("Signup Started");
      response = await http.post(url, body: body, headers: headers);
      log(response.body);

      if (response.statusCode == 200) {
        log("worked");
        status = true;

        SignupResponse signupResponse =
            SignupResponse.fromJson(jsonDecode(response.body));

        return signupResponse;
      } else {
        status = false;
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
      // throw Exception();
    }
  }

  Future verifyOtp({required String email, required String otp}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String verifyUrl = "https://eaglone-api.onrender.com/verify-email";
    final url = Uri.parse(verifyUrl);
    final body = {"email": email, "otp": otp};

    Map<String, String> headers = {
      "apikey":
          "verifyOtp \$2b\$14\$Spul3qDosNUGfGA.AnYWl.W1DH4W4AnQsFrNVEKJi6.CsbgncfCUi"
    };
    try {
      http.Response response;
      response = await http.post(url, body: body, headers: headers);

      log("otp worked");
      log(response.body);
      if (response.statusCode == 200) {
        verified = true;

        var data = jsonDecode(response.body);

        prefs.setString("token", data['token']);
        otpTrue = true;
        log(response.body);
      } else {
        verified = false;
        log(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      verified = false;
      log(e.toString());
      //throw Exception();
    }
  }
}
