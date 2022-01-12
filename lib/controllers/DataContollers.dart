// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/model/ResendOTPResponse.dart';
import 'package:takecare_user/model/UserLoginResponse.dart';

class DataControllers extends GetxController {
  static DataControllers to = Get.find();


  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  RxBool isLoading = false.obs;
  Rx<RegisterResponse> regsiter = new RegisterResponse().obs;
  Rx<UserLoginResponse> userLoginResponse = new UserLoginResponse().obs;
  Rx<ResendOTPResponse> resendOtpResponse = new ResendOTPResponse().obs;



  /**
   *    Post Request
   */

  Future postRegister(

      String first_name,
      String phone_no,
      String password,
      String role,) async {
    isLoading(true);
    var response = await ApiService.postRegister(
        first_name,
        phone_no,
        password,
        role);

    if (response != null) {
       regsiter.value = response;
      //responseSuccess(true);
    }

    isLoading(false);
    
    return  regsiter.value;
  }

  Future postLogin(String phone_number, String pass) async {
    isLoading(true);
    var response = await ApiService.postLogin(phone_number, pass);

    if (response != null) {
      userLoginResponse.value = response;
     // responseSuccess(true);
    }

    isLoading(false);

    return userLoginResponse.value;
  }



  Future postVerifyOTP(String phone_number, String otp) async {
    isLoading(true);
    var response = await ApiService.postVerifyOTP(phone_number, otp);

    if (response != null) {
      userLoginResponse.value = response;
     // responseSuccess(true);
    }

    isLoading(false);

    return userLoginResponse.value;
  }


   Future postResendOTP(String phone_no, ValueChanged<bool> responseSuccess) async {
    isLoading(true);
    var response = await ApiService.postResendOTP(phone_no);

    if (response != null) {
      resendOtpResponse.value = response;
      responseSuccess(true);
    }
    isLoading(false);

    return resendOtpResponse.value;
  }

}
