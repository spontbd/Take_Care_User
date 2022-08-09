
import 'package:flutter/material.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class ProviderProfilePage extends StatefulWidget {
  Providerdata providerdata;
   ProviderProfilePage({Key? key,required this.providerdata}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProviderProfilePage> {
  late List<String> genderList;

  late TextEditingController editPersonalHeight = new TextEditingController();
  late TextEditingController editPersonalWeight = new TextEditingController();
  late TextEditingController editPersonalNumber = new TextEditingController();
  late TextEditingController editPersonalEmail = new TextEditingController();

  late TextEditingController editAcademicName = new TextEditingController();
  late TextEditingController editAcademicYear = new TextEditingController();
  late TextEditingController editAcademicSub = new TextEditingController();
  late TextEditingController editAcademicCGPA = new TextEditingController();


  TextEditingController et_personal_commit = TextEditingController();
  TextEditingController et_other = TextEditingController();
  TextEditingController et_specialty = TextEditingController();
  TextEditingController et_past = TextEditingController();
  TextEditingController et_year = TextEditingController();
  TextEditingController et_license = TextEditingController();


  late TextEditingController editLanguage = new TextEditingController();

  late TextEditingController et_profile_page_language = new TextEditingController();
  late TextEditingController et_profile_page_academic = new TextEditingController();
  late TextEditingController et_profile_page_speciality = new TextEditingController();
  late TextEditingController et_profile_page_other_speciality = new TextEditingController();
  late TextEditingController et_profile_page_commitment = new TextEditingController();
  late TextEditingController et_profile_page_old_experience = new TextEditingController();

  @override
  void initState() {
    //getProfileEditableInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AllColor.pink_button,
        title: Text(LanguageController.lc.profile.value),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/images/cross.png"),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none, children: [
                Container(
                  height: dynamicSize(.2),
                  decoration: BoxDecoration(
                    color: AllColor.pink_button,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                Positioned(
                  top: dynamicSize(0.1),
                  left: MediaQuery.of(context).size.width / 3,
                  child: Column(
                    children: [
                      Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 110.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/baby.png"),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0 ,
                              child: Container(
                                  width: dynamicSize(0.18),
                                  //color: Colors.red,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                      ),
                                      Text(
                                        ("${DataControllers.to.userLoginResponse.value.data!.user!.status}"),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "/5",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: dynamicSize(0.06),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ("${widget.providerdata.fullName}"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.05),
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent),
                          ),
                          Row(
                            children: [
                              Text(
                                  ("${widget.providerdata.specialityId}")),
                              Text(
                                  "${""}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(
              height: dynamicSize(0.4),
            ),

            Container(child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 80,
                    width: dynamicSize(0.25),
                    color: AllColor.white_blue,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: dynamicSize(0.03),
                                color: Colors.grey),
                          ),
                          top: dynamicSize(0.03),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                          child: Text(
                            ("${widget.providerdata.gender}"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.04),
                                color: AllColor.button_color),
                          ),
                          top: dynamicSize(0.07),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                            top: dynamicSize(0.13),
                            left: dynamicSize(0.12),
                            child:
                                Image.asset("assets/images/gender_icon.png")),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 80,
                    width: dynamicSize(0.25),
                    color: AllColor.white_yellow,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "Height",
                            style: TextStyle(
                                fontSize: dynamicSize(0.03),
                                color: Colors.grey),
                          ),
                          top: dynamicSize(0.03),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                          child: Text(
                            ("${widget.providerdata.height} fit"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.04),
                                color: Colors.green),
                          ),
                          top: dynamicSize(0.07),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                            top: dynamicSize(0.14),
                            left: dynamicSize(0.12),
                            child:
                                Image.asset("assets/images/height_icon.png")),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 80,
                    width: dynamicSize(0.25),
                    color: AllColor.white_pink,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: dynamicSize(0.03),
                                color: Colors.grey),
                          ),
                          top: dynamicSize(0.03),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                          child: Text(
                            ("${widget.providerdata.wight} kg"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.04),
                                color: Colors.pink),
                          ),
                          top: dynamicSize(0.07),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                            top: dynamicSize(0.14),
                            left: dynamicSize(0.12),
                            child:
                                Image.asset("assets/images/weight_icon.png")),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 80,
                    width: dynamicSize(0.25),
                    color: AllColor.colorExperience,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "Experience",
                            style: TextStyle(
                                fontSize: dynamicSize(0.03),
                                color: Colors.grey),
                          ),
                          top: dynamicSize(0.03),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                          child: Text(
                            ("${widget.providerdata.height} yrs"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.04),
                                color: Colors.pink),
                          ),
                          top: dynamicSize(0.07),
                          left: dynamicSize(0.03),
                        ),
                        Positioned(
                            top: dynamicSize(0.12),
                            left: dynamicSize(0.13),
                            child:
                                Image.asset("assets/images/exp_icon.png")),
                      ],
                    ),
                  ),
                ),
              ],
            )),

            SizedBox(
              height: dynamicSize(0.06),
            ),

            ///Professional Details
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "License Number",
                        style: TextStyle(
                            fontSize: dynamicSize(0.04), color: Colors.blue),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: TextField(
                              cursorHeight: dynamicSize(0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'Enter Name',
                                  hintText: DataControllers.to.userLoginResponse
                                      .value.data!.user!.phone,
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: dynamicSize(0.02),
                    ),


                    ///Academic Details
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 10),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Education",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04), color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextField(
                                      // controller: et_profile_page_academic,
                                      cursorHeight: dynamicSize(0.05),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //labelText: 'Enter Name',
                                          hintText: et_profile_page_academic.text,
                                          hintStyle: TextStyle(color: Colors.black)),
                                    )),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Text(
                                "Institution",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04), color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextField(
                                      // controller: et_profile_page_language,
                                      cursorHeight: dynamicSize(0.05),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //labelText: 'Enter Name',
                                          hintText: et_profile_page_language.text,
                                          hintStyle: TextStyle(color: Colors.black)),
                                    )),
                              ),
                              alignment: Alignment.topLeft,
                            ),

                            Container(
                              child: Text(
                                "Passing Year",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04), color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextField(
                                      // controller: et_profile_page_language,
                                      cursorHeight: dynamicSize(0.05),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //labelText: 'Enter Name',
                                          hintText: et_profile_page_language.text,
                                          hintStyle: TextStyle(color: Colors.black)),
                                    )),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            //Speciality within Domain
            Container(
              color: AllColor.shado_color,
              height: dynamicSize(0.015),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Specialty ",
                        style: TextStyle(
                            fontSize: dynamicSize(0.04), color: Colors.blue),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: TextField(
                              // controller: et_profile_page_speciality,
                              //focusNode: professional,
                              cursorHeight: dynamicSize(0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'Enter Name',
                                  hintText: et_profile_page_speciality.text,
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: TextField(
                              //focusNode: professional,
                              cursorHeight: dynamicSize(0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'Enter Name',
                                  hintText: '- Specialty 02',
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ),

            // past ex
            Container(
              color: AllColor.shado_color,
              height: dynamicSize(0.015),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Past experience",
                        style: TextStyle(
                            fontSize: dynamicSize(0.04), color: Colors.blue),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: TextField(
                          //    controller: et_profile_page_old_experience,
                              //focusNode: professional,
                              cursorHeight: dynamicSize(0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'Enter Name',
                                  hintText: et_profile_page_old_experience.text,
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: AllColor.shado_color,
              height: dynamicSize(0.015),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Personal Commitment",
                        style: TextStyle(
                            fontSize: dynamicSize(0.04), color: Colors.blue),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: dynamicSize(0.01),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Container(
                            alignment: Alignment.topLeft,
                            child: TextField(
                            //  controller: et_profile_page_commitment,
                              //enabled: text_enable_professional,
                              //focusNode: professional,
                              cursorHeight: dynamicSize(0.05),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  //labelText: 'Enter Name',
                                  hintText: et_profile_page_commitment.text
                                  /* "I will do my best to make you comfortable.\n I strongly believe in ethics; as a health provider being ethical is not just a remembered value, but a strongly observed one."*/
                                  ,
                                  hintStyle: TextStyle(color: Colors.black)),
                            )),
                      ),

                      /*Text(
                        "I will do my best to make you comfortable. I strongly believe in ethics; as a health provider being ethical is not just a remembered value, but a strongly observed one.",
                        style: TextStyle(fontSize: dynamicSize(0.04)),
                      ),*/
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ),


            SizedBox(
              height: dynamicSize(0.01),
            ),
            Container(
              color: AllColor.shado_color,
              height: dynamicSize(0.015),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Document",
                        style: TextStyle(
                            fontSize: dynamicSize(0.04), color: Colors.blue),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NID",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "VIEW",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.04),
                                  color: Colors.pink),
                            ),
                          )
                        ],
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "License",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "VIEW",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.04),
                                  color: Colors.pink),
                            ),
                          )
                        ],
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chairman Certificate",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          TextButton(
                            onPressed: () {


                            },
                            child: Text(
                              "VIEW",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.04),
                                  color: Colors.pink),
                            ),
                          )
                        ],
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: dynamicSize(0.06),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ));
  }
/*
  void getProfileEditableInformation() async{
    et_profile_page_academic.text = DataControllers.to.personProfileResponse
            .value.data!.userAcademicInfos![0].institute! +
        " \nCompletion year : " +
        widget.providerdata
            .userAcademicInfos![0].passingYear!;
    et_profile_page_language.text = DataControllers.to.personProfileResponse
            .value.data!.languageProficiency!.isNotEmpty
        ? widget.providerdata
            .languageProficiency![0].languageName!
        : "";
    et_profile_page_licence.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? DataControllers
            .to.personProfileResponse.value.data!.professionData![0].licenseNo!
        : "";

    et_profile_page_experience.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? widget.providerdata
            .professionData![0].yearOfExperience!
        : "";
    et_profile_page_old_experience.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? widget.providerdata
            .professionData![0].otherSpeciality!
        : "";
    et_profile_page_commitment.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? widget.providerdata
            .professionData![0].personalCommitment!
        : "";

    et_profile_page_experience_year.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? widget.providerdata
            .professionData![0].yearOfExperience!
        : "";
    et_profile_page_speciality.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? DataControllers
            .to.personProfileResponse.value.data!.professionData![0].speciality!
        : "";
    et_profile_page_other_speciality.text = DataControllers
            .to.personProfileResponse.value.data!.professionData!.isNotEmpty
        ? widget.providerdata
            .professionData![0].otherSpeciality!
        : "";

    await DataControllers.to.fetchAcademicInformation(
        widget.providerdata.id.toString());
  }

  void getUserInfo() async {
    await DataControllers.to.getProfileInformation();
    setState(() {
      DataControllers.to.personProfileResponse;
    });
  }*/

  void personalInformationEditDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "You can edit your personal information.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: dynamicSize(0.03), color: Colors.red),
            ),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: editPersonalHeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "in",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: editPersonalWeight,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "kg",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                    ],
                  ),

                  ///Number
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Number",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      Text(
                          "${DataControllers.to.userLoginResponse.value.data!.user!.phone}"
                          // controller: editPersonalNumber,
                          // DataControllers.to.userServiceResponse.value.data![position].service!.price

                          /* DataControllers.to.allServiceResponse.value.data![index].imagePath*/
                          ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: editPersonalEmail,
                          // DataControllers.to.userServiceResponse.value.data![position].service!.price

                          /* DataControllers.to.allServiceResponse.value.data![index].imagePath*/
                        ),
                      )
                    ],
                  ),

                  ///Gender
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Row(
                      children: genderList
                          .map((item) => Expanded(
                                  child: InkWell(
                                onTap: () => setState(() =>
                                    DataControllers.to.gender.value = item),
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      right: item ==
                                                  LanguageController
                                                      .lc.male.value ||
                                              item ==
                                                  LanguageController
                                                      .lc.female.value
                                          ? MediaQuery.of(context).size.width *
                                              .02
                                          : 0.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AllColor.blue),
                                      color: item ==
                                              DataControllers.to.gender.value
                                          ? AllColor.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .01))),
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.width *
                                              .025,
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .04),
                                  child: Text(
                                    item,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .04,
                                        color: item ==
                                                DataControllers.to.gender.value
                                            ? Colors.white
                                            : AllColor.textColor),
                                  ),
                                ),
                              )))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Column(
                children: [
                  Container(
                    height: dynamicSize(0.003),
                    width: dynamicSize(1),
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            /*decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(0.0),
                                                    ),*/
                            //margin: EdgeInsets.only(bottom: 5),
                            /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: dynamicSize(0.1),
                        width: dynamicSize(0.003),
                        color: Colors.grey,
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            //margin: EdgeInsets.only(bottom: 5),
                            /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () async {

                                //showBottomSheetAddedDialog(context);
                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  void academicInformationEditDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "You can edit your academic information.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: dynamicSize(0.03), color: Colors.red),
            ),
            content: Container(
              height: 200,
              child: Column(
                children: [
                  ///Education
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Education ",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: editAcademicName,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Subject",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: editAcademicSub ,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Passing  Year",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: editAcademicYear,
                        ),
                      )
                    ],
                  ),



          Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "CGPA",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: editAcademicCGPA,
                        ),
                      )
                    ],
                  ),


                ],
              ),
            ),
            actions: [
              Column(
                children: [
                  Container(
                    height: dynamicSize(0.003),
                    width: dynamicSize(1),
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            /*decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(0.0),
                                                    ),*/
                            //margin: EdgeInsets.only(bottom: 5),
                            /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: dynamicSize(0.1),
                        width: dynamicSize(0.003),
                        color: Colors.grey,
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () async {


                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  void professionalInformationEditDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "You can edit your academic information.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: dynamicSize(0.03), color: Colors.red),
            ),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  /// Licence
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Licence ",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller:  et_license,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Specialty",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: et_specialty ,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Other Specialty",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: et_other,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Past Specialty",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: et_past,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 20, left: 10),
                        child: Text(
                          "Year",
                          style: TextStyle(fontSize: dynamicSize(0.03)),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: et_year,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Column(
                children: [
                  Container(
                    height: dynamicSize(0.003),
                    width: dynamicSize(1),
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            /*decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(0.0),
                                                    ),*/
                            //margin: EdgeInsets.only(bottom: 5),
                            /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: dynamicSize(0.1),
                        width: dynamicSize(0.003),
                        color: Colors.grey,
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: dynamicSize(0.10),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            /*  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(5.0),
                                                    ),*/
                            //margin: EdgeInsets.only(bottom: 5),
                            /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              onPressed: () async {

                                /*         await DataControllers.to
                                    .editAcademicInformation(DataControllers.to.academicResponse.value.data![0].id.toString(), DataControllers.to.userLoginResponse.value.data!.user!.id.toString(),
                                    editAcademicName.text,editAcademicSub.text,editAcademicYear.text,editAcademicCGPA.text);*/
                                Navigator.pop(context);

        //showBottomSheetAddedDialog(context);
                              },
                              //color: AllColor.button_color,
                              textColor: Colors.black,
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

}
