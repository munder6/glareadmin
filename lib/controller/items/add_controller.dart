import 'dart:io';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/items/view_controller.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/core/functions/uploadimage.dart';
import 'package:glareadmin/data/model/categoriesmodel.dart';
import 'package:glareadmin/data/remote/categories_data.dart';
import 'package:glareadmin/data/remote/items_data.dart';

class ItemsAddController extends GetxController {
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


  StatusRequest? statusRequest = StatusRequest.none;
  File? file;


  showImageOption(){
    showbutomsheet(chooseImageCamera , chooseImageGallery );
  }

  chooseImageCamera()async{
   file = await imageUploadCamera();
   update();
  }

  chooseImageGallery()async{
    file = await imageUploadGallery(false);
    update();
  }

  addData() async {

    if(formState.currentState!.validate()){
      if (file == null) Get.snackbar("Alert", "Please Choose Image");

      statusRequest = StatusRequest.loading;

      update();
      Map data = {
        "name" : name.text,
        "namear" : namear.text,
        "desc" : desc.text,
        "descar" : descar,
        "count" : count.text,
        "price" : price.text,
        "descount" : discount,
        "catid" : catid,
        "datenow" : DateTime.now().toString(),
      };
      var response = await itemsData.add(data , file!);
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

  @override
  void onInit() {
    getCat();
    addData();
    name = TextEditingController();
    namear = TextEditingController();
    statusRequest;
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    dropdownid = TextEditingController();
    dropdownname = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    super.onInit();
  }

  showDropList(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"),SelectedListItem(name: "b")],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
         // showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  getCat() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for(int i = 0 ; i < data.length ; i++){
          dropdownlist.add(SelectedListItem(name : data[i].categoriesName! , value: data[i].categoriesId));
        }


      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }
}