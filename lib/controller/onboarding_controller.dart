
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/services/services.dart';
import 'package:glareadmin/data/static/static.dart';


abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  next() {

    currentPage++ ;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "2");
    Get.offAllNamed(AppRoute.login);
    }else {
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 700), curve:Curves.easeInOut) ;

    }

  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }




}

