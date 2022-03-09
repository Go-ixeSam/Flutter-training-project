import 'package:flutter/material.dart';
import 'package:online_croceries/ui/beverages/beverages_screen.dart';
import 'package:online_croceries/ui/homescreen/home.dart';
import 'package:online_croceries/ui/location/select_location.dart';
import 'package:online_croceries/ui/login/login.dart';
import 'package:online_croceries/ui/number/phone_login_screen.dart';
import 'package:online_croceries/ui/order_status/success.dart';
import 'package:online_croceries/ui/sign_up/sign_up.dart';
import 'package:online_croceries/ui/signin/sign_screen.dart';
import 'package:online_croceries/ui/splash/splash_screen.dart';
import 'package:online_croceries/ui/verification/verification_screen.dart';
import 'package:online_croceries/ui/vinhome/vi_home.dart';
import 'package:online_croceries/ui/vinhome/vi_login.dart';
import 'package:online_croceries/ui/vinhome/vi_search.dart';
import 'package:online_croceries/ui/vinhome/vi_welcome.dart';
import 'package:online_croceries/ui/web_view/tinh_te.dart';
import 'package:online_croceries/ui/welcome/welcome_page.dart';
import 'package:online_croceries/ui/vinhome/vi_splash_screen.dart';
import 'package:online_croceries/widgets/bottom_navigation.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String sign_up = '/signUp';
  static const String login = '/login';
  static const String category = '/category';
  static const String splash = "/splash";
  static const String welcome = "/welcome";
  static const String signIn = '/signIn';
  static const String phone_login = '/number';
  static const String phone_verification = '/verification';
  static const String detail = '/detail';
  static const String clothes = '/clothes';
  static const String cart = '/cart';
  static const String location = "/location";
  static const String sign_in_selection = "/sign_in_selection";
  static const String beverages = '/beverages';
  static const String success = '/success';
  static const String splashVi = "/splash_vin";
  static const String welcomeVi = "/welcome_vin";
  static const String loginVi = "/login_vin";
  static const String homeVi = "/home_vin";
  static const String homeSearch = "/search_vin";
  static const String tinh_te = "/tinh_te";
  // static const String navigator = '/beverages';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => BottomNavigation(),
    sign_up: (BuildContext context) => SignUp(),
    login: (BuildContext context) => Login(),
    splash: (BuildContext context) => SplashScreen(),
    welcome: (BuildContext context) => WellcomePage(),
    phone_login: (BuildContext context) => NumberScreen(),
    phone_verification: (BuildContext context) => VerificationScreen(),
    location: (BuildContext context) => Location(),
    sign_in_selection: (BuildContext context) => SignInScreen(),
    beverages: (BuildContext context) => BeveragesScreen(),
    success: (BuildContext context) => Success(),
    splashVi: (BuildContext context) => SplashScreenVi(),
    welcomeVi: (BuildContext context) => WelcomeVi(),
    loginVi: (BuildContext context) => ViLogin(),
    homeVi: (BuildContext context) => ViHome(),
    homeSearch: (BuildContext context) => ViSearch(),
    tinh_te: (BuildContext context) => TinhTe(),
  };
}
