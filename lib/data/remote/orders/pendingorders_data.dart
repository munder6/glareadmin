
import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class OrderPendingData {
  Curd curd;

  OrderPendingData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.ordersPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder( String userid, String ordersid) async {
    var response = await curd.postData(AppLink.ordersApprove, {
      "usersid" : userid,
      "ordersid" : ordersid

    });
    return response.fold((l) => l, (r) => r);
  }
}