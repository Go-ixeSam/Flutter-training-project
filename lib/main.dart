import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/constants/vin_color.dart';
import 'package:online_croceries/stores/cart/cart_store.dart';
import 'package:online_croceries/stores/category/category_store.dart';
import 'package:online_croceries/stores/dashboard/dashboard_store.dart';
import 'package:online_croceries/stores/favorite/favorite_store.dart';
import 'package:online_croceries/stores/language/language_store.dart';
import 'package:online_croceries/stores/shop/shop_store.dart';
import 'package:online_croceries/stores/food_category/food_category_store.dart';
import 'package:online_croceries/stores/testing/pos_store.dart';
import 'package:online_croceries/stores/user/user_store.dart';
import 'package:online_croceries/ui/beverages/beverages_screen.dart';
import 'package:online_croceries/ui/cart/cart_screen.dart';
import 'package:online_croceries/ui/favorite/favorite_screen.dart';
import 'package:online_croceries/ui/filter/filter_screen.dart';
import 'package:online_croceries/ui/login/login.dart';
import 'package:online_croceries/ui/number/phone_login_screen.dart';
import 'package:online_croceries/ui/order_status/success.dart';
import 'package:online_croceries/ui/search/search_screen.dart';
import 'package:online_croceries/ui/signin/sign_screen.dart';
import 'package:online_croceries/ui/splash/splash_screen.dart';
import 'package:online_croceries/ui/test.dart';
import 'package:online_croceries/ui/user/user_account.dart';
import 'package:online_croceries/ui/vinhome/vi_home.dart';
import 'package:online_croceries/ui/vinhome/vi_login.dart';
import 'package:online_croceries/ui/vinhome/vi_sign_in.dart';
import 'package:online_croceries/ui/vinhome/vi_splash_screen.dart';
import 'package:online_croceries/ui/vinhome/vi_verify.dart';
import 'package:online_croceries/ui/vinhome/vi_welcome.dart';
import 'package:online_croceries/utils/locale/app_localization.dart';
import 'package:online_croceries/utils/routes/routes.dart';
import 'package:online_croceries/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'data/repository.dart';
import 'di/components/service_locator.dart';
import 'ui/location/select_location.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_stetho/flutter_stetho.dart';
// import 'package:http/http.dart' as http;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setPreferredOrientations();
  await setupLocator();
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final CategoryStore _categoryStore = CategoryStore(getIt<Repository>());
  final DashboardStore _dashboardStore = DashboardStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final UserStore _userStore = UserStore(getIt<Repository>());
  final ShopStore _shopStore = ShopStore(getIt<Repository>());
  final FoodCategoryStore _foodCategoryStore = FoodCategoryStore(getIt<Repository>());
  final CartStore _cartStore = CartStore(getIt<Repository>());
  final PosStore _posStore = PosStore(getIt<Repository>());

  final FavoriteStore _favoriteStore = FavoriteStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CategoryStore>(create: (_) => _categoryStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<DashboardStore>(create: (_) => _dashboardStore),
        Provider<ShopStore>(create: (_) => _shopStore),
        Provider<FoodCategoryStore>(create: (_) => _foodCategoryStore),
        Provider<CartStore>(create: (_) => _cartStore),
        Provider<FavoriteStore>(create: (_) => _favoriteStore),
        Provider<PosStore>(create: (_) => _posStore)
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
              title: 'Flutter Demo',
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              // home: APIUsing(),
              // home: BottomNavigation(),
              // home: Filter(),
              // home: NumberScreen(),
              // home: SplashScreen(),
              // home: SplashScreenVi(),
              // home: WelcomeVi(),
              // home: ViLogin(),
              // home: ViSignIn(),
              home: ViHome(),
              // home: ViVerify(),
              // home: CartScreen(),
              // home: Favorite(),
              // home:BeveragesScreen(),
              // home: Login(),
              // home: SearchProduct(),
              // home: SignInScreen(),
              // home: Success(),

              //todo: dòng theme dùng để set màu focus của cả app, tưc là khi một widget khi ở trạng thái focus thì nó sẽ có màu dựa trên field "colorScheme"
              theme: ThemeData().copyWith(
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: Color(VinColor.red))),
              routes: Routes.routes,
              locale: Locale(_languageStore.locale),
              supportedLocales: _languageStore.supportedLanguages
                  .map((e) => Locale(e.locale!, e.code))
                  .toList(),
              localizationsDelegates: [AppLocalizations.delegate]
              // home: APIUsing(),
              );
        },
        name: "global-observer",
      ),
    );
  }
}
