
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/categories/view_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/linkapi.dart';
import 'package:jiffy/jiffy.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesController controller =  Get.put(CategoriesController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRoute.categoriesAdd);
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
        leading: IconButton(onPressed: () {controller.onBack();},
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.black,),
        ),
        title:  Text("162".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context , index){
                  return InkWell(
                    onLongPress: (){controller.goToPageEdit(controller.data[index]);},
                    child: Card(
                            surfaceTintColor: Colors.transparent,

                      elevation: 10,
                      shadowColor: AppColor.black.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1 ,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: SvgPicture.network("${AppLink.imageCategories}/${controller.data[index].categoriesImage}",
                                    height: 60,
                                  )
                              )
                          ),
                          Expanded(
                              flex: 2 ,
                              child: ListTile(
                               title: Text(controller.data[index].categoriesName!),
                               subtitle: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(Jiffy(controller.data[index].categoriesDatetime!, "yyyy-MM-dd").fromNow()),
                                   const Text("Long Tap to edit item", style: TextStyle(color: AppColor.red, fontSize: 10),),
                                  // Text(controller.data[index].categoriesDatetime!),
                                 ],
                               ),
                                trailing: IconButton(
                                    onPressed: (){
                                      Get.defaultDialog(
                                          title: "Alert !",
                                        middleText: "Are sure of the deleting process ?",
                                        onCancel: (){},
                                        onConfirm: (){
                                            controller.deleteCat(controller.data[index].categoriesId!, controller.data[index].categoriesImage!);
                                            Get.back();
                                          }
                                      );
                                      }
                                    , icon: const Icon(Icons.delete_outline, color: AppColor.red,)),
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ) ,
      )
    );
  }
}
