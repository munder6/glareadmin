
import 'package:get/get.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/functions/handlingdatacontroller.dart';
import 'package:glareadmin/data/model/categoriesmodel.dart';
import 'package:glareadmin/data/remote/categories_data.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(AppRoute.categoriesEdit, arguments: {
      "categoriesModel" : categoriesModel,
    });
  }

  deleteCat(String id, String imagename){
    categoriesData.delete({"id" : id, "imagename" : imagename});
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