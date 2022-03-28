// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/model/ResendOTPResponse.dart';
import 'package:takecare_user/model/UserLoginResponse.dart';

import '../model/AllServiceResponse.dart';
import '../model/Erorr.dart';
import '../model/Expertise.dart';

class DataControllers extends GetxController {
  static DataControllers to = Get.find();


  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  RxBool isLoading = false.obs;
  Rx<RegisterResponse> regsiter = RegisterResponse().obs;
  Rx<UserLoginResponse> userLoginResponse = UserLoginResponse().obs;
  Rx<ResendOTPResponse> resendOtpResponse = ResendOTPResponse().obs;
  RxString gender = ''.obs;


  /// Service
  Rx<ExpertiseResponse> expertiseResponse =
      ExpertiseResponse(message: '', data: [], success: false).obs;
  Rx<ErrorResponse> errorResponse = ErrorResponse().obs;
  Rx<AllServiceResponse> allServiceResponse = AllServiceResponse().obs;
  Rx<AllServiceResponse> shortServiceResponse = AllServiceResponse().obs;
  Rx<AllServiceResponse> longServiceResponse = AllServiceResponse().obs;





  Future getAllLongService(String type) async {
    isLoading(true);

    var response = await ApiService.fetchAllLongShortServiceResponse(type);

    if (response != null) {
      longServiceResponse.value = response;

      // responseSuccess(true);
    }
    isLoading(false);
  }

  Future getAllShortService(String type) async {
    isLoading(true);

    var response = await ApiService.fetchAllLongShortServiceResponse(type);

    if (response != null) {
      shortServiceResponse.value = response;

      // responseSuccess(true);
    }
    isLoading(false);
  }

  Future getAllService() async {
    isLoading(true);

    var response = await ApiService.fetchServiceResponse();

    if (response != null) {
      allServiceResponse.value = response;

      // responseSuccess(true);
    }
    isLoading(false);
  }

  Future getExpertise() async {
    isLoading(true);
    update();
    var response = await ApiService.fetchExpertiseResponse();
    print(expertiseResponse);
    if (response != null) {
      expertiseResponse.value = response;
      update();
      print(expertiseResponse.value.data.length);
      // responseSuccess(true);
    }
    isLoading(false);
    update();
  }




  /**
   *    Post Request
   */

  Future postRegister(String first_name, String phone_no, String password, String gender, String role, String image,) async {
    isLoading(true);
    var response = await ApiService.postRegister(
        first_name,
        phone_no,
        password,
        gender,
        role,
        image
    );

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
