import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/localization/changelocal.dart';
import 'package:glareadmin/view/wedgit/auth/logoauth.dart';
import 'package:glareadmin/view/wedgit/language/custombuttonlang.dart';



class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const SizedBox(height: 90,),
          Text("1".tr, style: Theme.of(context).textTheme.headline2?.copyWith(color: AppColor.primaryColor),),
          const Spacer(),
          const ChoseLang(),
          const SizedBox(height: 110,),
          CustomButtonLang(textbutton: 'العربية',onPressed: (){
            controller.chaneLang("ar");
            Get.toNamed(AppRoute.onBoarding);
          }),
          const SizedBox(height: 10,),
          CustomButtonLang(textbutton: 'English',onPressed: (){
            controller.chaneLang("en");
            Get.toNamed(AppRoute.onBoarding);
          })
        ],
      ),
    );
  }
}
