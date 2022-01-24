import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_croceries/data/local/datasources/category_datasource.dart';
import 'package:online_croceries/data/network/cart/cart_api.dart';
import 'package:online_croceries/data/network/category/category_api.dart';
import 'package:online_croceries/data/network/dashboard/dashboard_api.dart';
import 'package:online_croceries/data/network/dio_client.dart';
import 'package:online_croceries/data/network/favorite/favorite_api.dart';
import 'package:online_croceries/data/network/food_product/food_category_api.dart';
import 'package:online_croceries/data/network/login/login_api.dart';
import 'package:online_croceries/data/network/rest_client.dart';
import 'package:online_croceries/data/network/shop/shop_api.dart';
import 'package:online_croceries/data/network/testing/pos_api.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/data/sharedpref/shared_preference_helper.dart';
import 'package:online_croceries/di/module/local_module.dart';
import 'package:online_croceries/di/module/network_module.dart';
import 'package:online_croceries/stores/cart/cart_store.dart';
import 'package:online_croceries/stores/category/category_store.dart';
import 'package:online_croceries/stores/dashboard/dashboard_store.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/stores/food_category/food_category_store.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/stores/language/language_store.dart';
import 'package:online_croceries/stores/shop/shop_store.dart';
import 'package:online_croceries/stores/testing/pos_store.dart';
import 'package:online_croceries/stores/user/user_store.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // Chỉ tạo duy nhất instance kể từ khi khởi động app

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(CategoryApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(LoginApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(DashboardApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(ShopApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(FoodCategoryAPI(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(CartApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(FavoriteAPI(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(PosAPI(getIt<DioClient>(), getIt<RestClient>()));

  // data sources
  getIt.registerSingleton(CategoryDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<CategoryApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<CategoryDataSource>(),
    getIt<LoginApi>(),
    getIt<DashboardApi>(),
    getIt<ShopApi>(),
    getIt<FoodCategoryAPI>(),
    getIt<CartApi>(),
    getIt<FavoriteAPI>(),
    getIt<PosAPI>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(CategoryStore(getIt<Repository>()));
  getIt.registerSingleton(UserStore(getIt<Repository>()));
  getIt.registerSingleton(DashboardStore(getIt<Repository>()));
  getIt.registerSingleton(ShopStore(getIt<Repository>()));
  getIt.registerSingleton(FoodCategoryStore(getIt<Repository>()));
  getIt.registerSingleton(CartStore(getIt<Repository>()));
  getIt.registerSingleton(PosStore(getIt<Repository>()));
}
