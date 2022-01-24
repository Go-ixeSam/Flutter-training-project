// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardStore on _DashboardStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_DashboardStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_DashboardStore.fetchPostsFuture');

  @override
  ObservableFuture<List<String>?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<List<String>?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$dashboardListAtom = Atom(name: '_DashboardStore.dashboardList');

  @override
  List<String>? get dashboardList {
    _$dashboardListAtom.reportRead();
    return super.dashboardList;
  }

  @override
  set dashboardList(List<String>? value) {
    _$dashboardListAtom.reportWrite(value, super.dashboardList, () {
      super.dashboardList = value;
    });
  }

  final _$successAtom = Atom(name: '_DashboardStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$getDashboardsAsyncAction =
      AsyncAction('_DashboardStore.getDashboards');

  @override
  Future<dynamic> getDashboards() {
    return _$getDashboardsAsyncAction.run(() => super.getDashboards());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
dashboardList: ${dashboardList},
success: ${success},
loading: ${loading}
    ''';
  }
}
