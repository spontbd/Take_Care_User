import 'package:get/get.dart';
import 'package:takecare_user/controller/data_controller.dart';

class SizeConfig{
  final DataController dataController =Get.find();
  double width() {
    return dataController.size.value;
  }
}

double dynamicSize(double size){
  return SizeConfig().width()*size;
}