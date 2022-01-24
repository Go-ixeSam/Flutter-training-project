import 'dart:ffi';

import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/favorite_product/favorite_product.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/models/product_real/food_favorite_list.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _FavoriteStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<FoodFavoriteList?> emptyFavoriteResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<FoodFavoriteList?> fetchFavoritesFuture =
  ObservableFuture<FoodFavoriteList?>(emptyFavoriteResponse);

  @observable
  FoodFavoriteList? favoriteList;

  @observable
  FoodFavoriteList? cartList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchFavoritesFuture.status == FutureStatus.pending;


  // actions:-------------------------------------------------------------------
  @action
  Future getFavoriteList() async {
    final future = _repository.getFoodFavoriteList();
    fetchFavoritesFuture = ObservableFuture(future);
    future.then((favoriteList) {
      this.favoriteList = favoriteList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future addCart(List<int>ids) async {
    final future = _repository.addCart(ids);
    fetchFavoritesFuture = ObservableFuture(future);

    future.then((favoriteList) {
      this.cartList = favoriteList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
