
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

var signIn_or_SignUP = false;
var progressValue = 33.0;
class Variables {
  static const List<String> genderList=['Male','Female','Others'];
  static const List<String> FahilyList=['Male','Female','Others'];
  static File imageFile = new File(" ");
  static String base64Image = " ";
  static int exp = 0;
  static int spe = 0;
  static late  SharedPreferences storeSharedPreferences;

}


 var bearerToken = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZWM3OTM4NmNjZjIzODI2ZTM1M2QwYzEzM2Y5MWViZTA5ZmE5MTAyNzY0MzViM2Y1ZmNmNzczNTk5MmMxMTAwMDFiYjMxODNkOGRjNTRjYmUiLCJpYXQiOjE2NDM3Nzc0MDIuNTUxMDc2LCJuYmYiOjE2NDM3Nzc0MDIuNTUxMDgsImV4cCI6MTY0NTA3MzQwMi41NDg5NDcsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.l5PVSVa01U470pYw4-xNZbLYI2EFzs6hgCIi2pThArQBDVNP0IPgF2d7mxBeNUxv5HNyue_tniYOGfC4tU5wP0Ek_XQZqyhByRuRcdpFeU61iaNHMJ0vGupwS7g_km6smvvDGdw_8flKtQ0tvevSElvLXQlUCV931DEuoz25QiBUqMCrO-m0dI1BEd1Qt0z9tLjfYb00-zQfFPdK5GV2HqQVPl8eMkxpl8v8hwQWejfE6eOSLYelHoJlgw70RPjkjqJo4W4bxIVC-ijRE2ZgQH6m5UOyFtD42vobdCvou8DkwKnGhIi-1xHAtK3d8UxD-RBI0tgv90KuNLBH0LF1O9f92B0iPFN7qYfu1v-pOQd7njTiCha29erOh5uUhg770414N4NYL6A2tJljHr3TXV1ghRe08fyMpzg-ed6uG_HEDkoCkdJeax98c2aynm8oQj_UehXlKyopyhwJFoouhFBp_LPq7kJDvhE5p1d4JxK3YxkPvFr9WChwcWtPh9Q_GDdNtlLRtwdcdUMe_A-Cfb4vxmKbJIVGj_eDbjW96_gqAjY9Qo6dtZg_kRdwlxk2wR7HCTOZw84v6b9e_ymNLLxW4b-HVNt03Ra4vDArxn5m7KZEs0pEtBsdkXEmiIdLyNmq-EqtiMGAbRv1A6aqRrKB_f7wOxRTuL8X_RJVC8k";
