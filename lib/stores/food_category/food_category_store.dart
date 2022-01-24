import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/product_real/food_category_list.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'food_category_store.g.dart';

class FoodCategoryStore = _FoodCategoryStore with _$FoodCategoryStore;

abstract class _FoodCategoryStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _FoodCategoryStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<FoodCategoryList?> emptyPostResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<FoodCategoryList?> fetchPostsFuture =
  ObservableFuture<FoodCategoryList?>(emptyPostResponse);

  @observable
  FoodCategoryList? foodCategoryList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getFoodCategories() async {
    final future = _repository.getListOfFoodCategory();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.foodCategoryList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  // @action
  // void setFood
}
