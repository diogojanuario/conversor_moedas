// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreApp on _StoreAppBase, Store {
  final _$loadingAtom = Atom(name: '_StoreAppBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$updateListCurrencyAtom =
      Atom(name: '_StoreAppBase.updateListCurrency');

  @override
  bool get updateListCurrency {
    _$updateListCurrencyAtom.reportRead();
    return super.updateListCurrency;
  }

  @override
  set updateListCurrency(bool value) {
    _$updateListCurrencyAtom.reportWrite(value, super.updateListCurrency, () {
      super.updateListCurrency = value;
    });
  }

  final _$updateDateAtom = Atom(name: '_StoreAppBase.updateDate');

  @override
  String get updateDate {
    _$updateDateAtom.reportRead();
    return super.updateDate;
  }

  @override
  set updateDate(String value) {
    _$updateDateAtom.reportWrite(value, super.updateDate, () {
      super.updateDate = value;
    });
  }

  @override
  ObservableFuture<void> setUpdateListCurrency() {
    final _$future = super.setUpdateListCurrency();
    return ObservableFuture<void>(_$future);
  }

  final _$loadingAppAsyncAction = AsyncAction('_StoreAppBase.loadingApp');

  @override
  Future<void> loadingApp(bool value) {
    return _$loadingAppAsyncAction.run(() => super.loadingApp(value));
  }

  final _$setUpdateDateAsyncAction = AsyncAction('_StoreAppBase.setUpdateDate');

  @override
  Future<void> setUpdateDate() {
    return _$setUpdateDateAsyncAction.run(() => super.setUpdateDate());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
updateListCurrency: ${updateListCurrency},
updateDate: ${updateDate}
    ''';
  }
}
