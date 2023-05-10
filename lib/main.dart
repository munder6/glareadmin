import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glareadmin/binding/initialbinding.dart';
import 'package:glareadmin/core/localization/changelocal.dart';
import 'package:glareadmin/core/localization/translation.dart';
import 'package:glareadmin/core/services/services.dart';
import 'package:glareadmin/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme:  controller.appTheme,
      getPages: routes,
      //routes: routes,
      initialBinding: InitialBindings(),
    );
  }
}
