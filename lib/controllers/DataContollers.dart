// ignore_for_file : prefer_collection_literals

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/model/AddCardResponse.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';
import 'package:takecare_user/model/CategoriesResponse.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/model/ResendOTPResponse.dart';
import 'package:takecare_user/model/SaveAddressResponse.dart';
import 'package:takecare_user/model/SliderResponse.dart';
import 'package:takecare_user/model/UserLoginResponse.dart';
import 'package:takecare_user/public_variables/notifications.dart';

import '../model/AllServiceResponse.dart';
import '../model/AvailableProviderResponse.dart';
import '../model/Erorr.dart';
import '../model/Expertise.dart';
import '../model/ShortServiceResponse.dart';
import '../model/UserServiceResponse.dart';

class DataControllers extends GetxController {
  static DataControllers to = Get.find();

  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> otp_forget = TextEditingController().obs;
  Rx<TextEditingController> forgetPasswordMobile = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  RxBool isLoading = false.obs;
  Rx<RegisterResponse> regsiter = RegisterResponse().obs;
  Rx<UserLoginResponse> userLoginResponse = UserLoginResponse().obs;
  Rx<ResendOTPResponse> resendOtpResponse = ResendOTPResponse().obs;
  RxString relation = ''.obs;
  RxString gender = ''.obs;
  RxString hours = ''.obs;
  RxString year = ''.obs;

  /// Service
  Rx<ExpertiseResponse> expertiseResponse =
      ExpertiseResponse(message: '', data: [], success: false).obs;
  Rx<ErrorResponse> errorResponse = ErrorResponse().obs;
  Rx<AllServiceResponse> allServiceResponse = AllServiceResponse().obs;
  Rx<AllServiceResponse> shortServiceResponse = AllServiceResponse().obs;
  Rx<AllServiceResponse> longServiceResponse = AllServiceResponse().obs;

  Rx<ErrorResponse> addServiceResponse = ErrorResponse().obs;
  Rx<UserServiceResponse> userServiceResponse = UserServiceResponse().obs;

  ///
  Rx<SliderResponse> sliderResponse = SliderResponse().obs;


  /// Forget password

  Rx<ErrorResponse> forgetPassMobileOtpResponse = ErrorResponse().obs;
  Rx<ErrorResponse> forgetPassConfirm = ErrorResponse().obs;

  /// AddCard
  Rx<ErrorResponse> addCardResponse = ErrorResponse().obs;
  // Rx<AddCardResponse> getAddCardResponse = AddCardResponse().obs;
  Rx<AddCardResponse> getAddCardShortServiceResponse = AddCardResponse().obs;
  Rx<AddCardResponse> getAddCardLongServiceResponse = AddCardResponse().obs;

  /// Save Address
  Rx<ErrorResponse> addFavAddressResponse = ErrorResponse().obs;
  Rx<LovedOnesResponse> getFavAddressResponse = LovedOnesResponse().obs;

  ///Categories
  Rx<CategoriesResponse> getCategoriesResponse = CategoriesResponse().obs;

  ///available provider
  Rx<AvailableProviderResponse> getAvailableProviderList =
      AvailableProviderResponse().obs;

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

  Future getAllCategories() async {
    isLoading(true);

    var response = await ApiService.fetchAllCategoriesResponse();

    if (response != null) {
      getCategoriesResponse.value.success = response.success;
      getCategoriesResponse.value.message = response.message;
      getCategoriesResponse.value.data =[];
      response.data!.forEach((element) {
        if(element.serviceType == 'long')
          {
            getCategoriesResponse.value.data!.add(element);
          }
      });

      // responseSuccess(true);
    }
    isLoading(false);
    return getCategoriesResponse;
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

  Future getProviderList(String status, String available) async {
    isLoading(true);
    getAvailableProviderList = AvailableProviderResponse().obs;
    var response = await ApiService.getAvailableProviderList(status, available);

    if (response != null) {
      getAvailableProviderList.value = response;
      // responseSuccess(true);
    }
  }

  Future getCard(String type) async {
    isLoading(true);
    getAddCardShortServiceResponse = AddCardResponse().obs;
    getAddCardLongServiceResponse = AddCardResponse().obs;
    var response = await ApiService.fetchCard(type);

    if (response != null)
    {



      // response.data?.forEach((element) {
      //   if(type == 'short' && element.service!.serviceType == 'short') {
      //     getAddCardShortServiceResponse.value.data!.add(element);
      //   }else if(type == 'long' && element.service!.serviceType == 'long') {
      //       getAddCardLongServiceResponse.value.data?.add(element);
      //     }
      // });

      if(type == 'short') {
          // getAddCardShortServiceResponse.value.message = response.message;
          // getAddCardShortServiceResponse.value.success = response.success;
        getAddCardShortServiceResponse.value = response;
          return getAddCardShortServiceResponse.value;
        }else {
            // getAddCardLongServiceResponse.value.message = response.message;
            // getAddCardLongServiceResponse.value.success = response.success;
        getAddCardLongServiceResponse.value = response;
            return getAddCardLongServiceResponse.value;
          }
    }
  }

  /// Forget password

 /* Future forgetPassMobileValidation(String number) async {
    isLoading(true);
    var response = await ApiService.forgetPassMobileValidation(number);

    if (response != null) {
      forgetPassMobileOtpResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return forgetPassMobileOtpResponse.value;
  }
*/


  Future forgetPassMobileValidation( String number, String signature) async {
    isLoading(true);
    var response =
    await ApiService.forgetPassMobileValidation(number,signature);

    if (response != null) {
      forgetPassMobileOtpResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return forgetPassMobileOtpResponse.value;
  }



  Future forgetPassConfirmMethod(
      String number, String otp, String newPass) async {
    isLoading(true);
    var response = await ApiService.forgetPassConfirm(number, otp, newPass);

    if (response != null) {
      forgetPassConfirm.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return forgetPassConfirm.value;
  }

  Future addCard(String service_id, String date) async {
    isLoading(true);
    var response = await ApiService.addCard(service_id, date);

    if (response != null) {
      addCardResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addCardResponse.value;
  }

  Future addFavAddress(
      String name, String age, String contact_no,
      String relationship, String gender

      ) async {
    isLoading(true);
    var response = await ApiService.addFavAddress(
        name, age, contact_no, relationship, gender);

    if (response != null) {
      addFavAddressResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addFavAddressResponse.value;
  }

  Future editFavAddress(String id, String name, String age, String contact_no,
   String relationship,

      String gender) async {
    isLoading(true);
    var response = await ApiService.editFavAddress(id, name, age, contact_no, gender, relationship);

    if (response != null) {
      addFavAddressResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addFavAddressResponse.value;
  }


  Future getFavAddress() async {
    isLoading(true);
    var response = await ApiService.getFavAddress();

    if (response != null) {
      getFavAddressResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return getFavAddressResponse.value;
  }

  Future deleteCard(String user_id, String id) async {
    isLoading(true);
    var response = await ApiService.deleteCard(user_id, id);

    if (response != null) {
      addCardResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addCardResponse.value;
  }

  Future deleteAllCard(String user_id) async {
    isLoading(true);
    var response = await ApiService.deleteAllCard(user_id);

    if (response != null) {
      addCardResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addCardResponse.value;
  }

  Future addService(String user_id, String service_id) async {
    isLoading(true);
    var response = await ApiService.addService(user_id, service_id);

    if (response != null) {
      addServiceResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);

    return addServiceResponse.value;
  }

  Future postRegister(String first_name, String phone_no, String password, String gender, String role, String image, String signature) async {
    isLoading(true);
    var response = await ApiService.postRegister(
        first_name, phone_no, password, gender, role, image, signature);

    if (response != null) {
      regsiter.value = response;
      //responseSuccess(true);
    }

    isLoading(false);
    return regsiter.value;
  }

  Future postLogin(String phone_number, String pass) async {
    isLoading(true);
    var response;
    userLoginResponse = UserLoginResponse().obs;
    // try {
      // final result = await InternetAddress.lookup('google.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//          print('connected');
        response = await ApiService.postLogin(phone_number, pass);
    //   }
    // } on SocketException catch (_) {
    //   isLoading(false);
    //   showToast("Check your internet Connection");
//        print('not connected');
//     }

    if (response != null) {
      userLoginResponse.value = response;
      // responseSuccess(true);
      isLoading(false);
    } else {
      isLoading(false);
      return userLoginResponse.value;
    }
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

  Future postUserServiceResponse(String user_id) async {
    var response = await ApiService.postUserServiceResponse(user_id);

    if (response != null) {
      userServiceResponse.value = response;
      update();
    }
    return userServiceResponse.value;
  }

  Future editService(String user_id, String service_id) async {
    isLoading(true);
    var response = await ApiService.editService(user_id, service_id);

    if (response != null) {
      addServiceResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);
    return addServiceResponse.value;
  }

  Future deleteService(String user_id, String id) async {
    isLoading(true);
    var response = await ApiService.deleteService(user_id, id);

    if (response != null) {
      addServiceResponse.value = response;
      // responseSuccess(true);
    }

    isLoading(false);
    return addServiceResponse.value;
  }


  /// Slider

  Future getSlider() async {
    isLoading(true);

    var response = await ApiService.fetchSliderResponse();

    if (response != null) {
      sliderResponse.value = response;

      // responseSuccess(true);
    }
    isLoading(false);
  }
}
