import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/categories/add_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/functions/validinput.dart';
import 'package:glareadmin/core/shared/customtextformglobal.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.black,),
        ),
        title:  Text("164".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: GetBuilder<CategoriesAddController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest!,
            widget: Container(
          padding: const EdgeInsets.all(15),
          child:Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    hinttext: "165".tr,
                    labeltext: "166".tr,
                    iconData: Icons.category,
                    mycontroller: controller.name,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                CustomTextFormGlobal(
                    hinttext: "167".tr,
                    labeltext: "168".tr,
                    iconData: Icons.category,
                    mycontroller: controller.namear,
                    valid: (val){
                      return validInput(val!, 1, 30, "");
                    },
                    isNumber: false
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    onPressed: (){
                      controller.chooseImage();
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
                      child: SvgPicture.file(controller.file!)),
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
