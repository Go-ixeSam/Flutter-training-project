// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_FavoriteStore.loading'))
      .value;

  final _$fetchFavoritesFutureAtom =
      Atom(name: '_FavoriteStore.fetchFavoritesFuture');

  @override
  ObservableFuture<FoodFavoriteList?> get fetchFavoritesFuture {
    _$fetchFavoritesFutureAtom.reportRead();
    return super.fetchFavoritesFuture;
  }

  @override
  set fetchFavoritesFuture(ObservableFuture<FoodFavoriteList?> value) {
    _$fetchFavoritesFutureAtom.reportWrite(value, super.fetchFavoritesFuture,
        () {
      super.fetchFavoritesFuture = value;
    });
  }

  final _$favoriteListAtom = Atom(name: '_FavoriteStore.favoriteList');

  @override
  FoodFavoriteList? get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(FoodFavoriteList? value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  final _$cartListAtom = Atom(name: '_FavoriteStore.cartList');

  @override
  FoodFavoriteList? get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(FoodFavoriteList? value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  final _$successAtom = Atom(name: '_FavoriteStore.success');

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

  final _$getFavoriteListAsyncAction =
      AsyncAction('_FavoriteStore.getFavoriteList');

  @override
  Future<dynamic> getFavoriteList() {
    return _$getFavoriteListAsyncAction.run(() => super.getFavoriteList());
  }

  final _$addCartAsyncAction = AsyncAction('_FavoriteStore.addCart');

  @override
  Future<dynamic> addCart(List<int> ids) {
    return _$addCartAsyncAction.run(() => super.addCart(ids));
  }

  @override
  String toString() {
    return '''
fetchFavoritesFuture: ${fetchFavoritesFuture},
favoriteList: ${favoriteList},
cartList: ${cartList},
success: ${success},
loading: ${loading}
    ''';
  }
}
