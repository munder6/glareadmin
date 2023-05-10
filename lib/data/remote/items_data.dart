
import 'dart:io';
import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class ItemsData {
  Curd curd;

  ItemsData(this.curd);

  get() async {
    var response = await curd.postData(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response = await curd.addRequestWithImageOne(AppLink.itemsAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if(file == null){
      response = await curd.postData(AppLink.itemsEdit, data);

    }else{
      response = await curd.addRequestWithImageOne(AppLink.itemsEdit, data, file);

    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await curd.postData(AppLink.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}