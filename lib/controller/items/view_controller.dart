
import 'package:get/get.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/data/model/itemsmodel.dart';
import 'package:glareadmin/data/remote/items_data.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  goToPageEdit(ItemsModel itemsModel){
    Get.toNamed(AppRoute.itemsEdit, arguments: {
      "itemsModel" : itemsModel,
    });
  }

  deleteItem(String id, String imagename){
    itemsData.delete({"id" : id, "imagename" : imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  @override
  void onInit() {

    getData();
    super.onInit();
  }

  onBack(){
    Get.offAllNamed(AppRoute.homeScreen);
  }
}