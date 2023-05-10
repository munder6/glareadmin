import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/items/view_controller.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/core/functions/uploadimage.dart';
import 'package:glareadmin/data/model/itemsmodel.dart';
import 'package:glareadmin/data/remote/items_data.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  List<SelectedListItem> dropdownlist = [];

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;


  TextEditingController? catname;
  TextEditingController? catid;
  //late TextEditingController active;

  String? active;


  StatusRequest? statusRequest = StatusRequest.none;
  File? file;

  ItemsModel? itemsModel;

  chooseImage()async{
    file = await imageUploadGallery(true);
    update();
  }

  editData() async {

    if(formState.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id" : itemsModel!.itemsId,
        "imageold" : itemsModel!.itemsImage ,
        "name" : name.text,
        "namear" : namear.text,
        "desc" : desc.text,
        "descar" : descar.text,
        "count" : count.text,
        "price" : price.text,
        "descount" : discount.text,
        "catid" : catid!.text,
        "datenow" : DateTime.now().toString(),
        "active" : active
      };
      var response = await itemsData.edit(data , file);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          ItemsController c = Get.find();
          Get.offNamed(AppRoute.itemsView);
          c.getData();
        } else {
          statusRequest = StatusRequest.failure ;
        }
      }
      update();
    }
  }


  changeStatusActive(val){

    active = val;
    update();


  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    statusRequest;

    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    dropdownid = TextEditingController();
    dropdownname = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;

    price.text = itemsModel!.itemsPrice!;
    count.text = itemsModel!.itemsCount!;
    discount.text = itemsModel!.itemsDescount!;

    catid!.text = itemsModel!.itemsCat!;
    catname!.text = itemsModel!.categoriesName!;

    active = itemsModel!.itemsActive;

    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;

    super.onInit();
  }
}