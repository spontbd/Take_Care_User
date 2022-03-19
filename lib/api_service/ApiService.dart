import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/model/ResendOTPResponse.dart';
import 'package:takecare_user/model/UserLoginResponse.dart';


class ApiService {
  static var client = http.Client();
  static var BaseURL = 'https://takecare.ltd/api/v1/';
  /**
   *    get Request
   */

  /**
   *    Post Request
   */

  static Future<RegisterResponse> postRegister(String first_name, String phone_no, String password, String gender, String role,String image,) async {

    final response = await http.post(
      Uri.parse(BaseURL+'register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(<String, String>{
      'full_name': first_name,
      'phone': phone_no,
      'password': password,
      'gender': gender,
      'role': role,
      'profile_photo': image,
    }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      return registerResponseFromJson(response.body);
    } else {

      Fluttertoast.showToast(
          msg:
          "Registration failed !!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return registerResponseFromJson(response.body);
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create.');
    }

    return registerResponseFromJson(response.body);

  }
  static Future<UserLoginResponse> postLogin(String phone_number,String pass) async {
    final response = await http.post(
      Uri.parse(BaseURL+'login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone_number,
        'password': pass,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      return userLoginResponseFromJson(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
          msg:
          "Please enter your valid user and password!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Exception('Failed to login');
    }

  }
  static Future<UserLoginResponse> postVerifyOTP(String phone_number,String otp) async {
    final response = await http.post(
      Uri.parse(BaseURL+'register/verify-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone_number,
        'otp': otp,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      return userLoginResponseFromJson(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
          msg:
          "Please enter your valid user and password!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Exception('Failed to login');
    }

  }
  static Future<ResendOTPResponse> postResendOTP(String phone_no) async {
    final response = await http.post(
      Uri.parse(BaseURL+'register/resend-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': phone_no,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
          msg:
          "Please enter your valid user and password!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      throw Exception('Failed to login');
    }
  }

}
