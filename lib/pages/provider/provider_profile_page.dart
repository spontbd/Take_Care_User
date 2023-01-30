import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/model/provider/user_documents.dart';
import 'package:takecare_user/pages/PDFReaderPage.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/widgets/image_view.dart';
import 'package:takecare_user/widgets/video_player_page.dart';

class ProviderProfilePage extends StatefulWidget {
  ProviderData providerdata;

  ProviderProfilePage({Key? key, required this.providerdata}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProviderProfilePage> {
  late List<String> genderList;

  // late TextEditingController editPersonalHeight = new TextEditingController();
  // late TextEditingController editPersonalWeight = new TextEditingController();
  // late TextEditingController editPersonalNumber = new TextEditingController();
  // late TextEditingController editPersonalEmail = new TextEditingController();
  //
  // late TextEditingController editAcademicName = new TextEditingController();
  // late TextEditingController editAcademicYear = new TextEditingController();
  // late TextEditingController editAcademicSub = new TextEditingController();
  // late TextEditingController editAcademicCGPA = new TextEditingController();

  //
  // TextEditingController et_personal_commit = TextEditingController();
  // TextEditingController et_other = TextEditingController();
  // TextEditingController et_specialty = TextEditingController();
  // TextEditingController et_past = TextEditingController();
  // TextEditingController et_year = TextEditingController();
  // TextEditingController et_license = TextEditingController();
  //
  //
  // late TextEditingController editLanguage = new TextEditingController();
  //
  // late TextEditingController et_profile_page_language = new TextEditingController();
  // late TextEditingController et_profile_page_academic = new TextEditingController();
  // late TextEditingController et_profile_page_speciality = new TextEditingController();
  // late TextEditingController et_profile_page_other_speciality = new TextEditingController();
  // late TextEditingController et_profile_page_commitment = new TextEditingController();
  // late TextEditingController et_profile_page_old_experience = new TextEditingController();

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
              clipBehavior: Clip.none,
              children: [
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
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: CachedNetworkImage(
                                  height: 110,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      '${widget.providerdata.profilePhoto}',
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/images/baby.png'),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                  width: dynamicSize(0.18),
                                  //color: Colors.red,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                      ),
                                      Text(
                                        ("${widget.providerdata.provider_rating}"),
                                        style: TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "/5",
                                        style: TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: dynamicSize(0.06),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.providerdata.fullName!,
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
                                fontSize: dynamicSize(0.05),
                                color: Colors.pinkAccent),
                          ),
                          Row(
                            children: [
                              Text(widget
                                  .providerdata.speciality!.specialityName!),
                              Text("${""}"),
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
            Container(
                child: Wrap(
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
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
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
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
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
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
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
                            child: Image.asset("assets/images/exp_icon.png")),
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
                      alignment: Alignment.topLeft,
                      child: Text(
                        (widget.providerdata.professionData! == null)
                            ? 'Loading....'
                            : widget
                                .providerdata.professionData!.first.license_no
                                .toString(),
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: dynamicSize(0.04),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: dynamicSize(0.01),
                    ),

                    ///Academic Details
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Education",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04),
                                    color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    (widget.providerdata.academicInfo! == null)
                                        ? 'Loading....'
                                        : ("${widget.providerdata.academicInfo!.first.major}"),
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: dynamicSize(0.01),
                            ),
                            Container(
                              child: Text(
                                "Institution",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04),
                                    color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    (widget.providerdata.academicInfo! == null)
                                        ? ''
                                        : ("${widget.providerdata.academicInfo!.first.institute}"),
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: dynamicSize(0.01),
                            ),
                            Container(
                              child: Text(
                                "Passing Year",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04),
                                    color: Colors.blue),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    (widget.providerdata.academicInfo! == null)
                                        ? ''
                                        : ("${widget.providerdata.academicInfo!.first.passing_year}"),
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.black),
                                  ),
                                ),
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
                      alignment: Alignment.topLeft,
                      child: Text(
                        (widget.providerdata.speciality! == null)
                            ? 'Loading....'
                            : ("${widget.providerdata.speciality!.specialityName!}"),
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: dynamicSize(0.04),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: dynamicSize(0.02),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child:
                            Text(widget.providerdata.speciality!.description!)),
                    SizedBox(
                      height: dynamicSize(0.02),
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
                      alignment: Alignment.topLeft,
                      child: Text(
                        (widget.providerdata.professionData! == null)
                            ? 'Loading....'
                            : ("${widget.providerdata.professionData!.first.past_experience ?? ''}"),
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: dynamicSize(0.04),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: dynamicSize(0.02),
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
                      alignment: Alignment.topLeft,
                      child: Text(
                        (widget.providerdata.professionData! == null)
                            ? 'Loading....'
                            : ("${widget.providerdata.professionData!.first.personal_commitment.toString()}"),
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: dynamicSize(0.04),
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: dynamicSize(0.02),
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
                    // if(widget.providerdata.user_documents! != null)

                    Container(
                      height: 200,
                      child: ListView.builder(
                          itemCount: (widget.providerdata.user_documents! == null) ? 0 : widget.providerdata.user_documents!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.providerdata.user_documents![index].title.toString(),
                                    style: TextStyle(fontSize: dynamicSize(0.04)),
                                  ),
                                  TextButton(
                                    onPressed: () {

                                      if(widget.providerdata.user_documents![index].extension == 'pdf') {


                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFReaderPage('${ApiService.MainURL}${widget.providerdata.user_documents![index].file}')
                                          ),
                                        );
                                      }else if( widget.providerdata.user_documents![index].extension == 'jpg' || widget.providerdata.user_documents![index].extension == 'png')
                                         {
                                           Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (context) =>
                                                     ImageView( url: '${ApiService.MainURL}${widget.providerdata.user_documents![index].file}', name: widget.providerdata.fullName.toString(),)
                                             ),
                                           );
                                         }
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
                            ),
                          )),
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

  Widget buidDocumentation(int index, UserDocuments data) {
    return Card(
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        margin:  EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: data.extension == 'pdf'
                        ? InkWell(
                            onTap: () {
                              PDFReaderPage(
                                  '${ApiService.MainURL}${data.file}');
                            },
                            child: Container(
                              alignment: Alignment.center,
                                height: 55,
                                width: 100,
                                color: Colors.blueAccent,
                                child: Icon(Icons.picture_as_pdf)
                                // child: PDFReaderPage('${ApiService.MainURL}${data.file}'),
                                ),
                          )
                        : data.extension == 'jpg' || data.extension == 'png'
                            ? CachedNetworkImage(
                      height: 170,
                                fit: BoxFit.fill,
                                imageUrl: '${ApiService.MainURL}${data.file}',
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/gallery_image.jpeg',
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                            : data.extension == 'video'
                                ? InkWell(
                                    onTap: () {
                                      VideoPlayerPage(
                                        url:
                                            '${ApiService.MainURL}${data.file}',
                                      );
                                    },
                                    child: Container(
                                        height: 55,
                                        width: 100,
                                        color: Colors.blueAccent,
                                        child: Icon(Icons.picture_as_pdf)
                                        // child: PDFReaderPage('${ApiService.MainURL}${data.file}'),
                                        ),
                                  )
                                : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
