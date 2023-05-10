


import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class VerfiyCodeResetPasswordData {
  Curd curd;

  VerfiyCodeResetPasswordData(this.curd);

  postdata(String email, String verifycode) async {
    var response = await curd.postData(AppLink.verfiyCodeResetPassword, {
      "email" : email ,
      "verifycode" : verifycode,

    });
    return response.fold((l) => l, (r) => r);
  }
}