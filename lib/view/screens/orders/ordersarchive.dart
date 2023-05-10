import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/orders/ordersarchive_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/view/wedgit/order/customordercardarchivelist.dart';


class OrdersArchiveScreen extends StatelessWidget {
  const OrdersArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersArchiveController controller = Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("106".tr , style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: AppColor.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
          builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context , index) =>  OrdersCardListArchive(listdata: controller.data[index],) ),
          )),
        ) ,
      ),
    );
  }
}




