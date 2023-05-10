
import 'dart:io';
import 'package:glareadmin/core/class/crud.dart';
import 'package:glareadmin/linkapi.dart';

class CategoriesData {
  Curd curd;

  CategoriesData(this.curd);

  get() async {
    var response = await curd.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response = await curd.addRequestWithImageOne(AppLink.categoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if(file == null){
      response = await curd.postData(AppLink.categoriesEdit, data);

    }else{
      response = await curd.addRequestWithImageOne(AppLink.categoriesEdit, data, file);

    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await curd.postData(AppLink.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}