


import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class ResetPasswordData {
  Curd curd;

  ResetPasswordData(this.curd);

  postdata(String email, String password) async {
    var response = await curd.postData(AppLink.resetPassword, {
      "email" : email ,
      "password" : password,

    });
    return response.fold((l) => l, (r) => r);
  }
}