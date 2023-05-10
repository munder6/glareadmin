import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/core/constant/color.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';





imageUploadCamera()async{
   final PickedFile? file = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 90);
   if (file != null){
     return File(file.path);
   }else{
     return null;
   }
}


imageUploadGallery([isSvg = false])async{

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["svg", "SVG"]
        : ["png", "PNG", "JPG", "jpg", "JPEG", "jpeg", "gif", "GIF"]);

  if (result != null){
    return File(result.files.single.path!);
  }else{
    return null;
  }

}

showbutomsheet(imageUploadCamera() , imageUploadGallery()){
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              child: const Text("Add Photo"),
            ),
            ListTile(
              onTap: (){
                imageUploadCamera();
                Get.back();
              },
              leading: Icon(Icons.camera_alt,size: 40,),title: const Text("Take Photo"),
            ),
            ListTile(
              onTap: (){
                imageUploadGallery();
                Get.back();
              },
              leading: const Icon(Icons.photo,size: 40,), title: const Text("Add Photo From Gallery"),
            )
          ],
        ),
      ),
    ),
    backgroundColor: AppColor.white
  );
}