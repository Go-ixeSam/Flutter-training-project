import 'package:mobx/mobx.dart';
import 'package:online_croceries/data/repository.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:online_croceries/models/dashboard/dashboard.dart';
import 'package:online_croceries/stores/error/error_store.dart';
import 'package:online_croceries/utils/dio_error_util.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _DashboardStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
// <<<<<<< HEAD
//   static ObservableFuture<List?> emptyPostResponse =
//       ObservableFuture.value(null);
//
//   @observable
//   ObservableFuture<List?> fetchPostsFuture =
//       ObservableFuture<List?>(emptyPostResponse);
//
//   @observable
//   List? dashboardList;
// =======
  static ObservableFuture<List<String>?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<List<String>?> fetchPostsFuture =
      ObservableFuture<List<String>?>(emptyPostResponse);

  @observable
  List<String>? dashboardList;
  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
// <<<<<<< HEAD
//   // @action
//   // Future getDashboards() async {
//   //   final future = _repository.getDashBoardBanner();
//   //   fetchPostsFuture = ObservableFuture(future);
//
//   //   future.then((postList) {
//   //     this.dashboardList = postList;
//   //   }).catchError((error) {
//   //     errorStore.errorMessage = DioErrorUtil.handleError(error);
//   //   });
//   // }
// =======
  @action
  Future getDashboards() async {
    final future = _repository.getDashBoardBanner();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.dashboardList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
