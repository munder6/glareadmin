import 'package:flutter/material.dart';
import 'package:glareadmin/core/class/statusrequest.dart';
import 'package:glareadmin/core/constant/imageasset.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {

  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        statusRequest == StatusRequest.loading ?
         Center(child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250)) :
        statusRequest == StatusRequest.offlinefailure ?
         Center(child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250)) :
        statusRequest == StatusRequest.serverfailure ?
         Center(child: Lottie.asset(AppImageAsset.servererror, width: 300, height: 300)) :
        statusRequest == StatusRequest.failure ?
         Center(child: Lottie.asset(AppImageAsset.noData, width: 300, height: 300, repeat: true)) : widget ;



  }
}


class HandlingDataRequest extends StatelessWidget {

  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest({Key? key, required this.statusRequest, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      statusRequest == StatusRequest.loading ?
      Center(child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250)) :
      statusRequest == StatusRequest.offlinefailure ?
      Center(child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250)) :
      statusRequest == StatusRequest.serverfailure ?
      Center(child: Lottie.asset(AppImageAsset.servererror, width: 300, height: 300))  : widget ;



  }
}
