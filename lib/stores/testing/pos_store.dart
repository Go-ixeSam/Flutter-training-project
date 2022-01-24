import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/shop/shop_list.dart';
import 'package:online_croceries/models/testing/jsonplaceholder.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'pos_store.g.dart';

class PosStore = _PosStore with _$PosStore;

abstract class _PosStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _PosStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<Pos?> emptyPostResponse =
  ObservableFuture.value(null);

  @observable
  ObservableFuture<Pos?> fetchPostsFuture =
  ObservableFuture<Pos?>(emptyPostResponse);

  @observable
  Pos? pos;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getPos() async {
    final future = _repository.getPos();
    fetchPostsFuture = ObservableFuture(future);
    future.then((postList) {
      this.pos = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
