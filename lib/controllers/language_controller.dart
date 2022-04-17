import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController{
  static LanguageController lc = Get.find();
  SharedPreferences? preferences;
  RxBool isEnglish = true.obs;

  RxString sigIn=''.obs;
  RxString signUp=''.obs;
  RxString mobileNumber=''.obs;
  RxString password=''.obs;
  RxString forgotPassword=''.obs;
  RxString name=''.obs;
  RxString male=''.obs;
  RxString female=''.obs;
  RxString other=''.obs;
  RxString greatNext=''.obs;
  RxString category=''.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }
  void initializeData()async{
    preferences = await SharedPreferences.getInstance();
    isEnglish.value = preferences!.getBool('isEnglish')??true;
    changeVariables();
    update();
  }

  void changeLanguage(bool val){
    isEnglish(val);
    changeVariables();
    update();
    preferences!.setBool('isEnglish',val);
  }

  void changeVariables(){
    sigIn(isEnglish.value?'Sign In': 'সাইন ইন');
    signUp(isEnglish.value?'Sign Up': 'সাইন আপ');

    mobileNumber(isEnglish.value?'Mobile Number*': 'মোবাইল নম্বর*');
    password(isEnglish.value?'password*': 'পাসওয়ার্ড*');
    forgotPassword(isEnglish.value?'Forgot Password?': 'পাসওয়ার্ড ভুলে গেছেন?');
    name(isEnglish.value?'Name*': 'নাম*');
    male(isEnglish.value?'Male': 'পুরুষ');
    female(isEnglish.value?'Female': 'মহিলা');
    other(isEnglish.value?'Others': 'অন্যান্য');
    greatNext(isEnglish.value?'Great! Next': 'মহান! পরবর্তী');
    category(isEnglish.value?'Category': 'বিভাগ');

    print('changed');
  }
}