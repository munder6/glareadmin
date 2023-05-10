
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/onboarding_controller.dart';
import 'package:glareadmin/view/wedgit/onBoarding/CustomSlider.dart';
import 'package:glareadmin/view/wedgit/onBoarding/custombutton.dart';
import 'package:glareadmin/view/wedgit/onBoarding/dotsController.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}