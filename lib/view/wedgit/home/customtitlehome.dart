



import 'package:flutter/cupertino.dart';
import 'package:glareadmin/core/constant/color.dart';


class CustomTitleHome extends StatelessWidget {

  final String title;
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style:const TextStyle(color: AppColor.black,fontSize: 18),);

  }
}
