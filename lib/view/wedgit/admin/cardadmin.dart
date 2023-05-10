import 'package:flutter/material.dart';
import 'package:glareadmin/core/constant/color.dart';

class CardAdmin extends StatelessWidget {
  final String url;
  final String title;
  final void Function()? onClick;


  const CardAdmin({Key? key, required this.url, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onClick,
      child: Card(
              surfaceTintColor: Colors.transparent,
        color: Colors.white,
        elevation: 10,
        shadowColor: AppColor.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            Image.asset(url, width: 80,),
            Text("$title", textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
