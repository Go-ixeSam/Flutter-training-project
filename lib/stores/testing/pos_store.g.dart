// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PosStore on _PosStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_PosStore.loading'))
      .value;

  final _$fetchPostsFutureAtom = Atom(name: '_PosStore.fetchPostsFuture');

  @override
  ObservableFuture<Pos?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<Pos?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  final _$posAtom = Atom(name: '_PosStore.pos');

  @override
  Pos? get pos {
    _$posAtom.reportRead();
    return super.pos;
  }

  @override
  set pos(Pos? value) {
    _$posAtom.reportWrite(value, super.pos, () {
      super.pos = value;
    });
  }

  final _$successAtom = Atom(name: '_PosStore.success');

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

  final _$getPosAsyncAction = AsyncAction('_PosStore.getPos');

  @override
  Future<dynamic> getPos() {
    return _$getPosAsyncAction.run(() => super.getPos());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
pos: ${pos},
success: ${success},
loading: ${loading}
    ''';
  }
}
