import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/auth/verfiycodesignup_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/view/wedgit/auth/customtextbodyauth.dart';
import 'package:glareadmin/view/wedgit/auth/customtexttitleauth.dart';
import 'package:glareadmin/view/wedgit/auth/logoauth.dart';



class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("25".tr, style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) =>
    HandlingDataRequest(
    statusRequest : controller.statusRequest,
    widget :
          Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 35),
        child: ListView(
          children: [
            const LogoAuthVerfiy(),
            CustomTextTitleAuth(text: "25".tr,),
            const SizedBox(height: 15,),
            CustomTextBodyAuth(text: '26'.tr,),
            const SizedBox(height: 30,),
            OtpTextField(
              fieldWidth: 50,
              fillColor: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
              enabledBorderColor: AppColor.primaryColor,
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verfiyCodeSignup){
                controller.goToSuccessSignUp(verfiyCodeSignup);
              }, // end onSubmit
            ),
            const SizedBox(height: 15,),
            InkWell(
              onTap: (){
                controller.reSend();
              } ,
              child: Center(child: Text("59".tr, style: TextStyle(fontSize: 15, color: AppColor.secondColor),)),
            )
          ],
        ),
      ),),
    ));
  }
}
