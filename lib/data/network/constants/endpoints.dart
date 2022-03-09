class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://fathomless-dusk-59762.herokuapp.com";
  // static const String

  //pratcise 2 api
  // static const String baseUrl2="https://fathomless-dusk-59762.herokuapp.com";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getCategories = baseUrl + "/categories";
  static const String getCategoryById = baseUrl + "/categories/1";
  static const String postNumber = baseUrl + "/phone-number";
  static const String verifyOTP = baseUrl + "/verify-otp";
  static const String login = baseUrl + "/token";
  static const String getDashBoardBanner = baseUrl + "/dashboard";
  static const String getShop = baseUrl + "/shop";
  static const String explore = baseUrl + "/explore";
  static const String getCart = baseUrl + "/cart";
  static const String getFavorite = baseUrl + "/favorite";
  static const String addCartFromFavorite = baseUrl + "/carts";
  static const String getTesting = "https://jsonplaceholder.typicode.com/posts";
  static const String getVincom = "http://10.0.2.2:3000/vinhome";
}
