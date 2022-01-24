import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/cart/cart_list.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/stores/form/form_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _CartStore(Repository repository) : this._repository = repository;

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<CartList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<CartList?> fetchPostsFuture =
      ObservableFuture<CartList?>(emptyPostResponse);

  @observable
  CartList? cartList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getCarts() async {
    final future = _repository.getCarts();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.cartList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
