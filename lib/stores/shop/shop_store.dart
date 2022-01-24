import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'shop_store.g.dart';

class ShopStore = _ShopStore with _$ShopStore;

abstract class _ShopStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ShopStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ShopList?> emptyPostResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<ShopList?> fetchPostsFuture =
  ObservableFuture<ShopList?>(emptyPostResponse);

  @observable
  ShopList? shopList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getShop() async {
    final future = _repository.getShop();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.shopList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
