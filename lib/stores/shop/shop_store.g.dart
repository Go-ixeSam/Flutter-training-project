// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShopStore on _ShopStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ShopStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_ShopStore.fetchPostsFuture');

  @override
  ObservableFuture<ShopList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<ShopList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$shopListAtom = Atom(name: '_ShopStore.shopList');

  @override
  ShopList? get shopList {
    _$shopListAtom.reportRead();
    return super.shopList;
  }

  @override
  set shopList(ShopList? value) {
    _$shopListAtom.reportWrite(value, super.shopList, () {
      super.shopList = value;
    });
  }

  final _$successAtom = Atom(name: '_ShopStore.success');

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

  final _$getShopAsyncAction = AsyncAction('_ShopStore.getShop');

  @override
  Future<dynamic> getShop() {
    return _$getShopAsyncAction.run(() => super.getShop());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
shopList: ${shopList},
success: ${success},
loading: ${loading}
    ''';
  }
}
