import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/categories/view_controller.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/core/functions/uploadimage.dart';
import 'package:glareadmin/data/remote/categories_data.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController namear;
  StatusRequest? statusRequest = StatusRequest.none;
  File? file;



  chooseImage()async{
   file = await imageUploadGallery(true);
   update();
  }

  addData() async {

    if(formState.currentState!.validate()){
      if (file == null) Get.snackbar("Alert", "Please Choose SVG Image");

      statusRequest = StatusRequest.loading;

      update();
      Map data = {
        "name" : name.text,
        "namear" : namear.text,
      };
      var response = await categoriesData.add(data , file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          CategoriesController c = Get.find();
          Get.offNamed(AppRoute.categoriesView);
          c.getData();
        } else {
          statusRequest = StatusRequest.failure ;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    statusRequest;
    namear = TextEditingController();
    addData();
    super.onInit();
  }
}