import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glareadmin/core/constant/routes.dart';
import 'package:glareadmin/core/middleware/mymiddleware.dart';
import 'package:glareadmin/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:glareadmin/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:glareadmin/view/screens/auth/forgetpassword/successresetpassword.dart';
import 'package:glareadmin/view/screens/auth/forgetpassword/veryfiycode.dart';
import 'package:glareadmin/view/screens/auth/forgetpassword/veryfiycodesignup.dart';
import 'package:glareadmin/view/screens/auth/signup.dart';
import 'package:glareadmin/view/screens/auth/success_signup.dart';
import 'package:glareadmin/view/screens/categories/add.dart';
import 'package:glareadmin/view/screens/categories/edit.dart';
import 'package:glareadmin/view/screens/categories/view.dart';
import 'package:glareadmin/view/screens/homescreen.dart';
import 'package:glareadmin/view/screens/items/add.dart';
import 'package:glareadmin/view/screens/items/edit.dart';
import 'package:glareadmin/view/screens/items/view.dart';
import 'package:glareadmin/view/screens/lang.dart';
import 'package:glareadmin/view/screens/onboarding.dart';
import 'package:glareadmin/view/screens/orders/orderdetails.dart';
import 'package:glareadmin/view/screens/orders/ordersaccepted.dart';
import 'package:glareadmin/view/screens/orders/ordersarchive.dart';
import 'package:glareadmin/view/screens/orders/orderspinding.dart';
import 'view/screens/auth/login.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => const Language(),middlewares: [MyMiddleware()]),
  //,middlewares: [MyMiddleware()]
  // GetPage(name: "/", page: () => const ProDetailsTest() ),
  //


  //GetPage(name: "/", page: ()=> const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VeryfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.ResetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.chooseLang, page: () => const Language()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesEdit, page: () => const CategoriesEdit()),
  GetPage(name: AppRoute.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsEdit, page: () => const ItemsEdit()),
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPendingScreen()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.ordersAccepted, page: () => const OrdersAcceptedScreen()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveScreen()),



];
