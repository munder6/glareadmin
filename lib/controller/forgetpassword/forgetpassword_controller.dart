

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/data/auth/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {

  CheckEmailData checkEmailData  = CheckEmailData(Get.find()) ;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none ;

  late TextEditingController email;

  @override
  checkemail() async  {
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkEmailData.postdata(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.VeryfiyCode , arguments: {
            "email" : email.text
          });
        } else {
          Get.defaultDialog(title: "39".tr , middleText: "46".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }


  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}