import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import 'package:online_croceries/models/vincom/vincom_all_product.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'vincom_store.g.dart';

class VincomStore = _VincomStore with _$VincomStore;

abstract class _VincomStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _VincomStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<Vincom?> emptyPostResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<Vincom?> fetchPostsFuture =
  ObservableFuture<Vincom?>(emptyPostResponse);

  @observable
  Vincom? vincom;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // @computed
  // int get searchResultLength=

  // actions:-------------------------------------------------------------------
  @action
  Future getVincom() async {
    final future = _repository.getVincom();
    fetchPostsFuture = ObservableFuture(future);
    future.then((vincom) {
      this.vincom = vincom;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
