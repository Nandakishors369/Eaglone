import 'dart:convert';
import 'dart:developer';
import 'package:eaglone/model/signup%20model/signup_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserAuth {
  bool verified = false;
  bool status = false;
  String baseUrl = "https://eaglone-api.onrender.com/user-signup";

  Future<SignupResponse> signup(
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

      if (response.statusCode == 200) {
        log("worked");
        status = true;
        log(response.body);

        SignupResponse signupResponse =
            SignupResponse.fromJson(jsonDecode(response.body));
        return signupResponse;
      } else {
        status = false;
        log(response.statusCode.toString());

        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    } finally {
      log("Signup Completed");
      log(status.toString());
    }
  }

  Future<SignupResponse?> verifyOtp(
      {required String email, required String otp}) async {
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
      SignupResponse signupResponse =
          SignupResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        verified = true;
        log(response.body);
        return signupResponse;
      } else {
        verified = false;
        return null;
      }
    } catch (e) {
      verified = false;
      log(e.toString());
      throw Exception();
    }
  }
}
