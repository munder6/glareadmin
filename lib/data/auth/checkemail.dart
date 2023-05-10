

import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class CheckEmailData {
  Curd curd;

  CheckEmailData(this.curd);

  postdata(String email) async {
    var response = await curd.postData(AppLink.checkEmail, {
      "email" : email ,

    });
    return response.fold((l) => l, (r) => r);
  }
}