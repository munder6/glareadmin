import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/controller/auth/login_controller.dart';
import 'package:glareadmin/core/class/handlingdataview.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'package:glareadmin/core/functions/alertexitapp.dart';
import 'package:glareadmin/core/functions/validinput.dart';
import 'package:glareadmin/view/wedgit/auth/custombuttonauth.dart';
import 'package:glareadmin/view/wedgit/auth/customtextbodyauth.dart';
import 'package:glareadmin/view/wedgit/auth/customtextformauth.dart';
import 'package:glareadmin/view/wedgit/auth/customtexttitleauth.dart';
import 'package:glareadmin/view/wedgit/auth/logoauth.dart';
import 'package:glareadmin/view/wedgit/auth/textsignup.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("3".tr, style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) =>
            HandlingDataRequest(
          statusRequest : controller.statusRequest,
          widget : Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const LogoAuth(),
                const SizedBox(height: 30,),
                CustomTextTitleAuth(text: "2".tr,),
                const SizedBox(height: 15,),
                CustomTextBodyAuth(text: '4'.tr,),
                const SizedBox(height: 30,),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 5, 100, "email");
                  },
                  hinttext: '6'.tr,
                  labeltext: '5'.tr,
                  iconData: Icons.email_outlined,
                  mycontroller: controller.email ,
                ),
                GetBuilder<LoginControllerImp>(builder: (controller)=> CustomTextFormAuth(
                  obsecureText: controller.isShowPassword,
                  onTapIcon: (){
                    controller.showPassword();
                  },
                  isNumber : false,
                  valid: (val){
                    return validInput(val!, 6, 64, "password");
                  },
                  hinttext: '7'.tr,
                  labeltext: '8'.tr,
                  iconData: Icons.lock_outline,
                  mycontroller: controller.password ,
                )),
                InkWell(
                  onTap: (){
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "9".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(height: 40,),
                CustomButtonAuth(
                    text: "10".tr,
                    onPressed: () {
                      controller.login();
                    }
                ),
                const SizedBox(height: 32),
                TextSignUp(
                  text: "12".tr,
                  text2: "11".tr,
                  onTap: (){controller.goToSignUp();} ,
                )
              ],
            ),
          ),
        ),)),
      ),
    );
  }
}
