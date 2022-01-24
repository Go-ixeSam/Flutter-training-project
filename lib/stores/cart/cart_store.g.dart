// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_CartStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_CartStore.fetchPostsFuture');

  @override
  ObservableFuture<CartList?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<CartList?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$cartListAtom = Atom(name: '_CartStore.cartList');

  @override
  CartList? get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(CartList? value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  final _$successAtom = Atom(name: '_CartStore.success');

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

  final _$getCartsAsyncAction = AsyncAction('_CartStore.getCarts');

  @override
  Future<dynamic> getCarts() {
    return _$getCartsAsyncAction.run(() => super.getCarts());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
cartList: ${cartList},
success: ${success},
loading: ${loading}
    ''';
  }
}
