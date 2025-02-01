// ignore_for_file: constant_identifier_names, non_constant_identifier_names


const String url = "https://demo-api.devdata.top";
const String imageUrl = "$url/";

//implementation 'com.facebook.android:facebook-android-sdk:[4,5)'

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) =>
      "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
}

final class Endpoints {
  Endpoints._();

//in use
  static String restaurantInfoEndpoint() => "/api/RestaurantInfo/GetRestaurantInfo";
  static String offerCardEndpoint() => "/api/RestaurantInfo/GetRestaurantOffer";
  static String categoryTabEndpoint() => "/api/RestaurantInfo/GetRestaurantMenuItem";
  static String categoryResultEndpoint({required int id}) => "/api/RestaurantInfo/GetRestaurantFoodItemByMenuId?menuId=$id";
  static String foodDetailsEndpoint({required int foodId}) => "/api/RestaurantInfo/GetRestaurantFoodByFoodId?foodId=$foodId";


  static String signUp() => "/api/users/register";
  static String verifyOtp() => "/api/users/register/otp-verify";
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  static String Resend() => "/api/users/register/otp-resend";
  static String Login() => "/api/users/login";
  static String EmailVerify() => "/api/users/login/email-verify";
  static String ForgetPw() => "/api/users/login/reset-password";
  static String Logout() => "/api/users/logout";
  static String Delete() => "/api/users/delete";
  static String profile() => "/api/users/data";
  static String socialLogin() => "/api/social-login";
  static String editProfile(int id) => "/api/users/update/$id";
  static String Banner() => "/api/banners";
  static String Category() => "/api/categorys";
  static String AllCategory() => "/api/categorys/all";
  static String GetAdds() => "/api/ads";
  static String GetNotification() => "/api/notifications";
  static String GetMyAdds() => "/api/my/ads";
  static String EditMyAdds(int id) => "/api/ad/edit/$id";
  static String GetCategorywiseAdd(int id) => "/api/category/$id/ads";
  static String GetAddsDetails(String id) => "/api/single/$id/ad";
  static String postBookmark() => "/api/bookmark/toggle";
  static String bookmarkget() => "/api/bookmarks";
  static String SearchAdds() => "/api/search/ad";
  static String postAdds() => "/api/ad/create";
  static String SaveAddress() => "/api/users/register/save-address";


  static String gDistanceApi() =>
      "https://maps.googleapis.com/maps/api/distancematrix/json?origins=";
  static String successfulPaymentUrlPrefix() =>
      "https://wedeapp.eu/payment-success";
  static String failedPaymentUrlPrefix() => "https://wedeapp.eu/payment-fail";
  static String paymentUrlProcessing() =>
      "https://wedeapp.eu/payment-processing";
}
