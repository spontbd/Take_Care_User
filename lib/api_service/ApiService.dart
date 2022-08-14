import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:takecare_user/model/AddCardResponse.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';
import 'package:takecare_user/model/CategoriesResponse.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/model/ResendOTPResponse.dart';
import 'package:takecare_user/model/SaveAddressResponse.dart';
import 'package:takecare_user/model/SliderResponse.dart';
import 'package:takecare_user/model/UserLoginResponse.dart';
import '../controller/data_controller.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import '../controllers/DataContollers.dart';
import '../model/AllServiceResponse.dart';
import '../model/Erorr.dart';
import '../model/Expertise.dart';
import '../model/UserServiceResponse.dart';
import '../ui/variables.dart';


class ApiService {

  static var client = http.Client();
  static var BaseURL = 'https://takecare.ltd/api/v1/';
  static var MainURL = 'https://takecare.ltd/';
  /**
   *    get Request
   */




  static Future<ExpertiseResponse?> fetchExpertiseResponse() async {
    print(bearerToken);
    var response = await client
        .get(Uri.parse(BaseURL + 'specialities'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    });
    print("Api Response : ${response.body}");
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return expertiseResponseFromJson(jsonString);
    } else {
      return null;
    }
  }



  static Future<AllServiceResponse?> fetchServiceResponse() async {
    var response = await client
        .get(Uri.parse(BaseURL + 'service/all'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    });
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return allServiceResponseFromJson(jsonString);
    } else {
      return null;
    }
  }


  static Future<AllServiceResponse?> fetchAllLongShortServiceResponse(String type) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'service/allbytype'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },
      body: jsonEncode(<String, String>{
        'service_type': type,
      }),
    );
    if (response.statusCode == 200) {
      print("Api Response  : ${response.body}");
      var jsonString = response.body;
      return allServiceResponseFromJson(jsonString);
    } else {
      return null;
    }
  }




  static Future<CategoriesResponse?> fetchAllCategoriesResponse() async {
    var response = await client
        .get(Uri.parse(BaseURL + 'service/categories'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    }
    );
    if (response.statusCode == 200) {
      print("Api Response categories : ${response.body}");
      var jsonString = response.body;
      return categoriesResponseFromJson(jsonString);
    } else {
      return null;
    }
  }




  /**
   *    Post Request
   */



  static Future<RegisterResponse> postRegister(String first_name, String phone_no, String password, String gender, String role,String image, String signature) async {

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
      'signature_otp': signature,
    }),
    );
    print(response.body);
    if (response.statusCode == 200) {
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
  static Future<UserLoginResponse> postLogin(String phoneNumber,String pass) async {
    ///Get Device token for push notification
    final String fcmToken = await DataController.dc.generateUserToken();
    print("fcmToken : "+fcmToken);
    var response ;
    try{
   response = await http.post(
    Uri.parse(BaseURL+'login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phoneNumber,
      'password': pass,
      'role_id': "4",
      'token': fcmToken
    }),
  );
}catch(e)

    {
print('errro');
print(e.toString());
    }

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 CREATED response,
      // then parse the JSON.
      await FirebaseFirestore.instance.collection('users').doc(phoneNumber).set({
        'phone': phoneNumber,
        'token': fcmToken,
        'date_time': DateTime.now().millisecondsSinceEpoch.toString()
      },SetOptions(merge: true));

      DataControllers.to.userLoginResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.userLoginResponse.value.message =
      json.decode(response.body)["message"];

      return userLoginResponseFromJson(response.body);
    } else {
     // showToast("Please enter your valid user and password!!");
      //throw Exception('Failed to login');
      DataControllers.to.userLoginResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.userLoginResponse.value.message =
      json.decode(response.body)["message"];
      return DataControllers.to.userLoginResponse.value;
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


      DataControllers.to.userLoginResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.userLoginResponse.value.message =
      json.decode(response.body)["message"];

      return DataControllers.to.userLoginResponse.value;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      DataControllers.to.userLoginResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.userLoginResponse.value.message =
      json.decode(response.body)["message"];

      return DataControllers.to.userLoginResponse.value;
      showToast("Please enter your valid user and password!!");
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




  /// Card Service

  static Future<AddCardResponse?> fetchCard(String type) async {
    var response = await client
        .get(Uri.parse(BaseURL + 'user/cart/list?type=${type}'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },

      // body: jsonEncode(<String, String>{
      //   'user_id': user_id,
      // }),

    );
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return addCardResponseFromJson(jsonString);
    } else {

      if(type == 'short')
        {
          DataControllers.to.getAddCardShortServiceResponse.value.success =
          json.decode(response.body)["success"];
          DataControllers.to.getAddCardShortServiceResponse.value.message =
          json.decode(response.body)["message"];
          return DataControllers.to.getAddCardShortServiceResponse.value;
        }
      else{
        DataControllers.to.getAddCardLongServiceResponse.value.success =
        json.decode(response.body)["success"];
        DataControllers.to.getAddCardLongServiceResponse.value.message =
        json.decode(response.body)["message"];
        return DataControllers.to.getAddCardLongServiceResponse.value;

      }
    }
  }




  static Future<ErrorResponse?> placeOrder(String id,  String user_id
      ) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/order/place-order'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    });
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      return null;
    }
  }



  static Future<ErrorResponse?> deleteCard(String user_id ,String id
      ) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/cart/delete-cart'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },
      body: jsonEncode(<String, String>{
        'id': id,
        'user_id': user_id,
      }),

    );
    if (response.statusCode == 200) {
      print("Api Response  delete card : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.addCardResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addCardResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addCardResponse.value;
    }
  }




  static Future<ErrorResponse?> deleteAllCard(String user_id
      ) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/cart/empty-cart'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },
      body: jsonEncode(<String, String>{

        'user_id': user_id,
      }),

    );
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.addCardResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addCardResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addCardResponse.value;
    }
  }




  static Future<ErrorResponse?> addCard(
      String service_id, String booking_date
      ) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/cart/add-service-to-cart'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },
      body: jsonEncode(<String, String>{

        'id': service_id,
        'booking_date': booking_date,
      }),

    );
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.addCardResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addCardResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addCardResponse.value;
    }
  }



  /// Service

  static Future<UserServiceResponse?> postUserServiceResponse(String user_id) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/service/all'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    },
      body: jsonEncode(<String, String>{
        'user_id': user_id,
      }),

    );
    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return userServiceResponseFromJson(jsonString);
    } else {
      DataControllers.to.userServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.userServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.userServiceResponse.value;
    }
  }



  static Future<ErrorResponse> addService(String user_id,String service_id) async {
    final response = await http.post(
      Uri.parse(BaseURL + 'user/service/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      },
      body: jsonEncode(<String, String>{
        'user_id': user_id,
        'service_id': service_id,
        'service_price': "200",
      }),
    );

    print(response.body);

    if (response.statusCode == 200)
    {



      return errorResponseFromJson(response.body);
    } else {
      DataControllers.to.addServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addServiceResponse.value;
      throw Exception('add service');
    }
  }

  ///  Update or Edit
  static Future<ErrorResponse> editService(String user_id,String service_id) async {
    final response = await http.post(
      Uri.parse(BaseURL + 'user/service/edit'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      },
      body: jsonEncode(<String, String>{
        'user_id': user_id,
        'service_id': service_id,
        'service_price': "200",
      }),
    );

    print(response.body);

    if (response.statusCode == 200)
    {



      return errorResponseFromJson(response.body);

    } else {
      DataControllers.to.addServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addServiceResponse.value;
      throw Exception('add service');
    }
  }

  /// Delete Section
  static Future<ErrorResponse> deleteService(String user_id,String id) async {
    final response = await http.post(
      Uri.parse(BaseURL + 'user/service/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      },
      body: jsonEncode(<String, String>{
        'user_id': user_id,
        'id': id,

      }),
    );

    print(response.body);

    if (response.statusCode == 200)
    {
      return errorResponseFromJson(response.body);
    } else {
      DataControllers.to.addServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addServiceResponse.value;
      throw Exception('add service');
    }
  }


  /// Service

  static Future<AvailableProviderResponse?> getAvailableProviderList(String status, String available) async {
    var response = await client
        .get(Uri.parse(BaseURL + 'user/providers-by-status?status=${status}&available=${available}'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    }/*,
      body: jsonEncode(<String, String>{
        'status': status,
        'available': available,
      }),*/

    );
    print("Api Response -> Available Provider List : ${response.body}");


    if (response.statusCode == 200) {
      var jsonString = response.body;
      return availableProviderResponseFromJson(jsonString);
    } else {
      DataControllers.to.getAvailableProviderList.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.getAvailableProviderList.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.getAvailableProviderList.value;
    }
  }



  ///   Forget Password


  static Future<ErrorResponse?> forgetPassMobileValidation(String number, String signature) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'forgot-password'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
      body: jsonEncode(<String, String>{
        'phone': number,
        'signature_otp': signature,
      }),

    );

    print("Api Response : ${response.body}");

    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.forgetPassMobileOtpResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.forgetPassMobileOtpResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.forgetPassMobileOtpResponse.value;
    }
  }

  static Future<ErrorResponse?> forgetPassConfirm(String number, String otp, String newPass) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'change-password-by-otp'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
      body: jsonEncode(<String, String>{

        'phone': number,
        'otp': otp,
        'new_password': newPass,
      }),

    );

        print("Api Response : ${response}");

    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.forgetPassConfirm.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.forgetPassConfirm.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.forgetPassConfirm.value;
    }
  }


  static Future<ErrorResponse?> addFavAddress(String name, String age, String contact_no,
      String relationship, String gender) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/loved-ones/add'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,

    },
      body: jsonEncode(<String, String>{
        'name': name,
        'age': age,
        'contact_no': contact_no,
        'relationship': relationship,
        'gender': gender
      }),
    );

    print("Api Response  data : ${response}");

    if (response.statusCode == 200) {
      print("Api Response  data : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.forgetPassConfirm.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.forgetPassConfirm.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.forgetPassConfirm.value;
    }
  }


  static Future<ErrorResponse?> editFavAddress(String id, String name, String age, String contact_no,
      String gender, String relationship) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/loved-ones/edit'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,

    },
      body: jsonEncode(<String, String>{
        'id': id,
        'name': name,
        'age': age,
        'contact_no': contact_no,
        'gender': gender,
        'relationship': relationship,
      }),
    );

    print("Api Response : ${response}");

    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.forgetPassConfirm.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.forgetPassConfirm.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.forgetPassConfirm.value;
    }
  }


  static getFavAddress() async{

    var response = await client
        .get(Uri.parse(BaseURL + 'user/loved-ones/all'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,

    });

    print("Api Response  fav-address : ${response.body}");

    if (response.statusCode == 200) {
      // print("Api Response : ${response.body}");
      var jsonString = response.body;
      return lovedOnesResponseFromJson(jsonString);
    } else {
      DataControllers.to.getFavAddressResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.getFavAddressResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.getFavAddressResponse.value;
    }

  }
  /// Delete Section
  static Future<ErrorResponse> deleteFavAddress(String id) async {
    final response = await http.post(
      Uri.parse(BaseURL + 'user/saved-address/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      },
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );

    if (response.statusCode == 200)
    {
      return errorResponseFromJson(response.body);
    } else {
      DataControllers.to.addServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addServiceResponse.value;
      throw Exception('add service');
    }
  }

  static Future<SliderResponse?> fetchSliderResponse() async {
    var response = await client
        .get(Uri.parse(BaseURL + 'app-sliders'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,
    }
    );
    if (response.statusCode == 200) {
      print("Api Response categories : ${response.body}");
      var jsonString = response.body;
      return sliderResponseFromJson(jsonString);
    } else {
      DataControllers.to.sliderResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.sliderResponse.value.message =
      json.decode(response.body)["message"];

      return DataControllers.to.sliderResponse.value;
    }
  }



  static Future<ErrorResponse?> editSaveAddress(String id, String phone, String beneficiary_name, String district,
      String city, String postcode, String lon, String lat) async {
    var response = await client
        .post(Uri.parse(BaseURL + 'user/saved-address/edit'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,

    },
      body: jsonEncode(<String, String>{
        'id': id,
        'phone': phone,
        'beneficiary_name': beneficiary_name,
        'district': district,
        'city': city,
        'postcode': postcode,
        'lon': lon,
        'lat': lat,
      }),
    );

    print("Api Response : ${response}");

    if (response.statusCode == 200) {
      print("Api Response : ${response.body}");
      var jsonString = response.body;
      return errorResponseFromJson(jsonString);
    } else {
      DataControllers.to.forgetPassConfirm.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.forgetPassConfirm.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.forgetPassConfirm.value;
    }
  }
  static getSaveAddress() async{

    var response = await client
        .post(Uri.parse(BaseURL + 'user/saved-address/all'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': bearerToken,

    });

    print("Api Response  saved-address : ${response.body}");

    if (response.statusCode == 200) {
      // print("Api Response : ${response.body}");
      var jsonString = response.body;
      return saveAddressResponseFromJson(jsonString);
    } else {
      DataControllers.to.getFavAddressResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.getFavAddressResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.getFavAddressResponse.value;
    }

  }
  /// Delete Section
  static Future<ErrorResponse> deleteSaveAddress(String id) async {
    final response = await http.post(
      Uri.parse(BaseURL + 'user/saved-address/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      },
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );

    if (response.statusCode == 200)
    {
      return errorResponseFromJson(response.body);
    } else {
      DataControllers.to.addServiceResponse.value.success =
      json.decode(response.body)["success"];
      DataControllers.to.addServiceResponse.value.message =
      json.decode(response.body)["message"];
      //showToast("Please enter your valid user and password!!",Colors.red);
      //  return errorResponseFromJson(response.body);
      return DataControllers.to.addServiceResponse.value;
      throw Exception('add service');
    }
  }


}
