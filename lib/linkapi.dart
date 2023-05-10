class AppLink {

  //======================== MainApi =========================//

  //static const String server = "https://glaregroup.site/glaregroupapi";
  static const String server = "https://glare.cu.ma/glaregroupapi";
  static const String adminServer = "https://glare.cu.ma/glaregroupapi/admin";
  //static const String imageStatic = "https://glaregroup.site/glaregroupapi/upload";
  static const String imageStatic = "https://glare.cu.ma/glaregroupapi/upload";

  //======================== Image =========================//

  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";


  //======================== items =========================//

  static const String items = "$server/items/items.php";


  //======================== Auth =========================//

  static const String signUp = "$adminServer/auth/signup.php";
  static const String login = "$adminServer/auth/login.php";
  static const String verifyCodeSignup = "$adminServer/auth/verfiycode.php";
  static const String resendVerifyCode = "$adminServer/auth/resendcode.php";

  //======================== Reset Password =========================//


  static const String checkEmail = "$adminServer/forgetpassword/checkemail.php";
  static const String verfiyCodeResetPassword = "$adminServer/forgetpassword/verfiycode.php";
  static const String resetPassword = "$adminServer/forgetpassword/resetpassword.php";



//======================== Home =========================//

  static const String homepage = "$server/home.php";



//======================== Favorite =========================//

 static const String addFavorite = "$server/favorite/add.php";
 static const String deleteFavorite = "$server/favorite/remove.php";
 static const String favoriteView = "$server/favorite/view.php";
 static const String deleteFromFavorite = "$server/favorite/deletefromfavorite.php";

//======================== Cart =========================//

  static const String addCart = "$server/cart/add.php";
  static const String deleteCart = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

//======================== Search =========================//

  static const String search = "$server/items/search.php";

//======================== Address =========================//

  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressView = "$server/address/view.php";


  //======================== Coupon =========================//

  static const String checkCoupon = "$server/coupon/checkcoupon.php";



  //======================== checkout =========================//


  static const String checkout = "$server/orders/checkout.php";



  //======================== Orders =========================//

  static const String ordersApprove  = "$adminServer/orders/approve.php";
  static const String orderPrepare   = "$adminServer/orders/prepare.php";
  static const String orderArchive   = "$adminServer/orders/archive.php";
  static const String ordersPending  = "$adminServer/orders/viewpending.php";
  static const String ordersAccepted = "$adminServer/orders/viewaccepted.php";
  static const String ordersDetails  = "$adminServer/orders/details.php";


//======================== Notifications =========================//


  static const String notification = "$server/notification.php";

//======================== Offers =========================//


  static const String offers = "$server/offers.php";


//======================== Rating =========================//


  static const String rating = "$server/rating.php";

//======================== Categories =========================//

  static const String categoriesView = "$adminServer/categories/view.php";
  static const String categoriesAdd = "$adminServer/categories/add.php";
  static const String categoriesEdit = "$adminServer/categories/edit.php";
  static const String categoriesDelete = "$adminServer/categories/delete.php";

//======================== Items =========================//

  static const String itemsView = "$adminServer/items/view.php";
  static const String itemsAdd = "$adminServer/items/add.php";
  static const String itemsEdit = "$adminServer/items/edit.php";
  static const String itemsDelete = "$adminServer/items/delete.php";






}