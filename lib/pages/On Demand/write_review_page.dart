import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/data_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({Key? key}) : super(key: key);

  @override
  _WriteReviewPageState createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  TextEditingController controller = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    DataController dataCntrl = Get.find();
    controller.text = dataCntrl.feedbackController.value.text;
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<DataController>(
        builder: (dataController) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.grey),
              leading: IconButton(
                onPressed: (){
                  dataController.clearFeedController();
                  Get.back();
                },
                icon: Icon(dataController.feedbackController.value.text.isEmpty
                    ?Icons.arrow_back:Icons.arrow_back),
              ),
              title: Text('Write Review',style: TextStyle(color: AllColor.black,fontSize: dynamicSize(.045))),
              titleSpacing: 0.0,
              elevation: 0.0,
              actions: [
                TextButton(
                  onPressed: (){
                    dataController.clearFeedController();
                    Get.back();
                  },
                  child: Text('Cancel',style: TextStyle(color: AllColor.black)),
                ),

                dataController.feedbackController.value.text.isNotEmpty
                    ?TextButton(
                  onPressed: ()=>Get.back(),
                  child: Text('Post',style: TextStyle(color: Colors.green)),
                ):Container()
              ],
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: controller,
                onChanged: (val){
                  dataController.updateFeedController(val);
                },
                maxLines: 15,
                minLines: 1,
                decoration: InputDecoration(
                    hintText: 'Write here...',
                    border: UnderlineInputBorder(borderSide: BorderSide.none)
                ),
              ),
            ),
          );
        }
    );
  }
}
