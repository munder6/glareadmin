import 'package:get/get.dart';
import 'package:glareadmin/core/services/services.dart';



translateDtaBase (columnar, columnen) {
  MyServices myServices = Get.find();
  if(myServices.sharedPreferences.getString("lang") == "ar"){
     return columnar;
  }else{
     return columnen;
  }

}