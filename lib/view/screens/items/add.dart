import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/items/add_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/functions/validinput.dart';
import 'package:glareadmin/core/shared/customdropdownsearch.dart';
import 'package:glareadmin/core/shared/customtextformglobal.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.black,),
        ),
        title:  Text("171".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: GetBuilder<ItemsAddController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: Container(
          padding: const EdgeInsets.all(15),
          child:Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    hinttext: "173".tr,
                    labeltext: "172".tr,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                CustomTextFormGlobal(
                    hinttext: "175".tr,
                    labeltext: "174".tr,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                CustomTextFormGlobal(
                    hinttext: "179".tr,
                    labeltext: "178".tr,
                    iconData: Icons.category,
                    mycontroller: controller.desc,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                CustomTextFormGlobal(
                    hinttext: "177".tr,
                    labeltext: "176".tr,
                    iconData: Icons.category,
                    mycontroller: controller.descar,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                CustomTextFormGlobal(
                    hinttext: "181".tr,
                    labeltext: "180".tr,
                    iconData: Icons.category,
                    mycontroller: controller.price,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: true
                ),
                CustomTextFormGlobal(
                    hinttext: "183".tr,
                    labeltext: "182".tr,
                    iconData: Icons.category,
                    mycontroller: controller.discount,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: true
                ),
                CustomTextFormGlobal(
                    hinttext: "185".tr,
                    labeltext: "184".tr,
                    iconData: Icons.category,
                    mycontroller: controller.count,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: true
                ),
                CustomDropDownSearch(
                  title: "Choose Category",
                  listdata: controller.dropdownlist,
                  dropDownSelectedName: controller.catname!, dropDownSelectedId: controller.catid!,),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: (){
                      controller.showImageOption();
                    }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Add Picture"),
                      SizedBox(width: 10),
                      Icon(Icons.photo),
                    ],
                  ),),
                ),
                if(controller.file != null)
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: Image.file(controller.file! ,width: 100, height: 100,)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: (){
                      controller.addData();
                    }, child: const Text("Add"),),
                )
              ],
            ),
          ),)),
      )
    );
  }
}
