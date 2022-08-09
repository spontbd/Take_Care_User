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
  RxString logOut=''.obs;
  RxString profile=''.obs;

  RxString search=''.obs;
  RxString onDemandServiceSetup=''.obs;
  RxString longTimeServiceSetup=''.obs;
  RxString personalDetails=''.obs;

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
    logOut(isEnglish.value?'Log Out': 'প্রস্থান');
    search(isEnglish.value?'Search..': 'অনুসন্ধান করুন');
    profile(isEnglish.value?'Profile': 'প্রোফাইল');
    personalDetails(isEnglish.value?"Personal Details": "ব্যক্তিগত বিবরণ");

    onDemandServiceSetup(isEnglish.value?'On Demand Service Setup': 'চাহিদা অনুযায়ী সেবা সেটআপ');
    // longTimeService(isEnglish.value?'Long Time Service': 'দীর্ঘ সময়ের পরিষেবা');
    longTimeServiceSetup(isEnglish.value?'Long Time Service Setup': 'দীর্ঘ সময়ের পরিষেবা সেটআপ');


    print('changed');
  }
}