

import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class VerifycodeSignUpData {
  Curd curd;

  VerifycodeSignUpData(this.curd);

  postdata(String email, String verifycode) async {
    var response = await curd.postData(AppLink.verifyCodeSignup , {
      "email" : email,
      "verifycode" : verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email)async{
    var response = await curd.postData(AppLink.resendVerifyCode , {
      "email" : email,
    });
    return response.fold((l) => l, (r) => r);
  }
}