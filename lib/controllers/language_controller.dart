import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController{
  static LanguageController lc = Get.find();
  SharedPreferences? preferences;
  RxBool isEnglish = true.obs;

  RxString sigIn=''.obs;
  RxString signUp=''.obs;


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
    print('changed');
  }
}