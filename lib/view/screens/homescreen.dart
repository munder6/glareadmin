import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/home_controller.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/constant/imageasset.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/view/wedgit/admin/cardadmin.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("156".tr, style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          GridView(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdmin(
                url: AppImageAsset.notifications,
                title: '160'.tr,
                onClick: () {},
              ),
              CardAdmin(
                url: AppImageAsset.messages,
                title: '159'.tr,
                onClick: () {},
              ),
              CardAdmin(
                url: AppImageAsset.orders,
                title: '186'.tr,
                onClick: () {
                  Get.toNamed(AppRoute.ordersPending);
                },
              ),
              CardAdmin(
                url: AppImageAsset.orders,
                title: '188'.tr,
                onClick: () {
                  Get.toNamed(AppRoute.ordersAccepted);
                },
              ),
              CardAdmin(
                url: AppImageAsset.orders,
                title: '187'.tr,
                onClick: () {
                  Get.toNamed(AppRoute.ordersArchive);
                },
              ),
              CardAdmin(
                url: AppImageAsset.customers,
                title: '157'.tr,
                onClick: () {},
              ),
              CardAdmin(
                url: AppImageAsset.categories,
                title: '162'.tr,
                onClick: () {
                  Get.toNamed(AppRoute.categoriesView);
                },
              ),
              CardAdmin(
                url: AppImageAsset.products,
                title: '158'.tr,
                onClick: () {
                  Get.toNamed(AppRoute.itemsView);
                },
              ),
              CardAdmin(
                url: AppImageAsset.reports,
                title: '163'.tr,
                onClick: () {},
              ),

          ],)
        ],
      ),
    );
  }
}


