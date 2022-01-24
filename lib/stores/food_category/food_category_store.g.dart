// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodCategoryStore on _FoodCategoryStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_FoodCategoryStore.loading'))
      .value;

  final _$fetchPostsFutureAtom =
      Atom(name: '_FoodCategoryStore.fetchPostsFuture');

  @override
  ObservableFuture<FoodCategoryList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<FoodCategoryList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$foodCategoryListAtom =
      Atom(name: '_FoodCategoryStore.foodCategoryList');

  @override
  FoodCategoryList? get foodCategoryList {
    _$foodCategoryListAtom.reportRead();
    return super.foodCategoryList;
  }

  @override
  set foodCategoryList(FoodCategoryList? value) {
    _$foodCategoryListAtom.reportWrite(value, super.foodCategoryList, () {
      super.foodCategoryList = value;
    });
  }

  final _$successAtom = Atom(name: '_FoodCategoryStore.success');

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

  final _$getFoodCategoriesAsyncAction =
      AsyncAction('_FoodCategoryStore.getFoodCategories');

  @override
  Future<dynamic> getFoodCategories() {
    return _$getFoodCategoriesAsyncAction.run(() => super.getFoodCategories());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
foodCategoryList: ${foodCategoryList},
success: ${success},
loading: ${loading}
    ''';
  }
}
