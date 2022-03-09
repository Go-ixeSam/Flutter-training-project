import 'dart:async';

import 'package:online_croceries/data/network/cart/cart_api.dart';
import 'package:online_croceries/data/network/dashboard/dashboard_api.dart';
import 'package:online_croceries/data/network/favorite/favorite_api.dart';
import 'package:online_croceries/data/network/login/login_api.dart';
import 'package:online_croceries/data/network/shop/shop_api.dart';
import 'package:online_croceries/data/network/testing/pos_api.dart';
import 'package:online_croceries/data/network/vincom/vincom_api.dart';
import 'package:online_croceries/data/sharedpref/shared_preference_helper.dart';
import 'package:online_croceries/models/cart/cart.dart';
import 'package:online_croceries/models/cart/cart_list.dart';
import 'package:online_croceries/models/category/category.dart';
import 'package:online_croceries/models/dashboard/dashboard.dart';
import 'package:online_croceries/models/favorite_product/favorite_product.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/data/network/food_product/food_category_api.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/product_real/food_category.dart';
import 'package:online_croceries/models/product_real/food_category_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import 'package:online_croceries/models/vincom/vincom_all_product.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'local/datasources/category_datasource.dart';
import 'network/category/category_api.dart';

class Repository {
  final CategoryDataSource _categoryDataSource;

  // api objects
  final CategoryApi _categoryApi;
  final LoginApi _loginApi;
  final PosAPI _posApi;
  final DashboardApi _dashboardApi;
  final ShopApi _shopApi;
  final FoodCategoryAPI _foodCategoryAPI;
  final CartApi _cartApi;
  final FavoriteAPI _favoriteAPI;
  final VincomAPI _vincomAPI;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
      this._categoryApi,
      this._sharedPrefsHelper,
      this._categoryDataSource,
      this._loginApi,
      this._dashboardApi,
      this._shopApi,
      this._foodCategoryAPI,
      this._cartApi,
      this._favoriteAPI,
      this._posApi,
      this._vincomAPI
      );
  // Repository(this._categoryApi, this._sharedPrefsHelper, this._categoryDataSource);

  // Category: ---------------------------------------------------------------------
  Future<CategoryList> getCategories() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _categoryApi.getCategoies().then((categoryList) {
      categoryList.categories?.forEach((post) {
        _categoryDataSource.insert(post);
      });

      return categoryList;
    }).catchError((error) => throw error);
  }

  Future<FoodFavoriteList> getFoodFavoriteList() async {
    return await _favoriteAPI.getFavoriteProductList().then((favoriteProducts) {
      return favoriteProducts;
    }).catchError((error) => throw error);
  }

  Future<FoodFavoriteList> addCart(List<int> ids) async {
    return await _favoriteAPI.addCart(ids).then((favoriteProducts) {
      return favoriteProducts;
    }).catchError((error) => throw error);
  }

  Future<FoodCategoryList> getListOfFoodCategory() async {
    return await _foodCategoryAPI
        .getListOfFoodCategory()
        .then((foodCategoryList) {
      foodCategoryList.foodCategories?.forEach((post) {
        // _categoryDataSource.insert(post);
      });

      return foodCategoryList;
    }).catchError((error) => throw error);
  }

  Future<List<Category>> findCategoryById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _categoryDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

// dash board
  Future<List<String>?> getDashBoardBanner() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _dashboardApi.getDashBoardBanner().then((images) {
      // images.dashboardImages?.forEach((post) {
      //   _categoryDataSource.insert(post);
      // });
      return images;
    }).catchError((error) => throw error);
  }

  //shops
  Future<ShopList> getShop() async {
    return await _shopApi.getShop().then((value) {
      return value;
    }).catchError((error) => throw error);
  }

  //cart
  Future<CartList> getCarts() async {
    return await _cartApi.getCart().then((value) {
      return value;
    }).catchError((error) => throw error);
  }

  Future<int> insert(Category post) => _categoryDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Category post) => _categoryDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Category post) => _categoryDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  // Login:---------------------------------------------------------------------

  // Nếu việc đăng nhập thành công thì sẽ lưu vào sharedPref
  //và trả về true
  Future<bool> login(String email, String password) async {
    return await _loginApi.login(email, password).then((value) {
      if (value != null) {
        _sharedPrefsHelper.saveAuthToken(value.access_token!);
        return true;
      } else {
        return false;
      }
    });
  }

  //testing
  Future<Pos> getPos() async {
    return await _posApi.getPosList().then((value) => value).catchError((onError)=>throw onError);
  }

  //vincom
  Future<Vincom> getVincom() async {
    return await _vincomAPI.getVincom().then((value) => value).catchError((onError)=>throw onError);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
