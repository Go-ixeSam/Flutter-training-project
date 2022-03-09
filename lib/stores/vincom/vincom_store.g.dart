// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vincom_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VincomStore on _VincomStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_VincomStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_VincomStore.fetchPostsFuture');

  @override
  ObservableFuture<Vincom?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<Vincom?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$vincomAtom = Atom(name: '_VincomStore.vincom');

  @override
  Vincom? get vincom {
    _$vincomAtom.reportRead();
    return super.vincom;
  }

  @override
  set vincom(Vincom? value) {
    _$vincomAtom.reportWrite(value, super.vincom, () {
      super.vincom = value;
    });
  }

  final _$successAtom = Atom(name: '_VincomStore.success');

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

  final _$getVincomAsyncAction = AsyncAction('_VincomStore.getVincom');

  @override
  Future<dynamic> getVincom() {
    return _$getVincomAsyncAction.run(() => super.getVincom());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
vincom: ${vincom},
success: ${success},
loading: ${loading}
    ''';
  }
}
