
import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class OrderAcceptedData {
  Curd curd;

  OrderAcceptedData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.ordersAccepted, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(String ordersid, String usersid , String ordertype) async {
    var response = await curd.postData(AppLink.orderPrepare, {
      "ordersid" : ordersid,
      "usersid" : usersid,
      "ordertype" : ordertype
    });
    return response.fold((l) => l, (r) => r);
  }
}