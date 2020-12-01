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

  final _$currencyOneAtom = Atom(name: '_StoreAppBase.currencyOne');

  @override
  String get currencyOne {
    _$currencyOneAtom.reportRead();
    return super.currencyOne;
  }

  @override
  set currencyOne(String value) {
    _$currencyOneAtom.reportWrite(value, super.currencyOne, () {
      super.currencyOne = value;
    });
  }

  final _$currencyNameOneAtom = Atom(name: '_StoreAppBase.currencyNameOne');

  @override
  String get currencyNameOne {
    _$currencyNameOneAtom.reportRead();
    return super.currencyNameOne;
  }

  @override
  set currencyNameOne(String value) {
    _$currencyNameOneAtom.reportWrite(value, super.currencyNameOne, () {
      super.currencyNameOne = value;
    });
  }

  final _$currencyTwoAtom = Atom(name: '_StoreAppBase.currencyTwo');

  @override
  String get currencyTwo {
    _$currencyTwoAtom.reportRead();
    return super.currencyTwo;
  }

  @override
  set currencyTwo(String value) {
    _$currencyTwoAtom.reportWrite(value, super.currencyTwo, () {
      super.currencyTwo = value;
    });
  }

  final _$currencyNameTwoAtom = Atom(name: '_StoreAppBase.currencyNameTwo');

  @override
  String get currencyNameTwo {
    _$currencyNameTwoAtom.reportRead();
    return super.currencyNameTwo;
  }

  @override
  set currencyNameTwo(String value) {
    _$currencyNameTwoAtom.reportWrite(value, super.currencyNameTwo, () {
      super.currencyNameTwo = value;
    });
  }

  final _$invertedAtom = Atom(name: '_StoreAppBase.inverted');

  @override
  bool get inverted {
    _$invertedAtom.reportRead();
    return super.inverted;
  }

  @override
  set inverted(bool value) {
    _$invertedAtom.reportWrite(value, super.inverted, () {
      super.inverted = value;
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

  final _$_StoreAppBaseActionController =
      ActionController(name: '_StoreAppBase');

  @override
  void setCurrencyOne(String value) {
    final _$actionInfo = _$_StoreAppBaseActionController.startAction(
        name: '_StoreAppBase.setCurrencyOne');
    try {
      return super.setCurrencyOne(value);
    } finally {
      _$_StoreAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrencyNameOne(String value) {
    final _$actionInfo = _$_StoreAppBaseActionController.startAction(
        name: '_StoreAppBase.setCurrencyNameOne');
    try {
      return super.setCurrencyNameOne(value);
    } finally {
      _$_StoreAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrencyTwo(String value) {
    final _$actionInfo = _$_StoreAppBaseActionController.startAction(
        name: '_StoreAppBase.setCurrencyTwo');
    try {
      return super.setCurrencyTwo(value);
    } finally {
      _$_StoreAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrencyNameTwo(String value) {
    final _$actionInfo = _$_StoreAppBaseActionController.startAction(
        name: '_StoreAppBase.setCurrencyNameTwo');
    try {
      return super.setCurrencyNameTwo(value);
    } finally {
      _$_StoreAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInverted(bool value) {
    final _$actionInfo = _$_StoreAppBaseActionController.startAction(
        name: '_StoreAppBase.setInverted');
    try {
      return super.setInverted(value);
    } finally {
      _$_StoreAppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
updateListCurrency: ${updateListCurrency},
updateDate: ${updateDate},
currencyOne: ${currencyOne},
currencyNameOne: ${currencyNameOne},
currencyTwo: ${currencyTwo},
currencyNameTwo: ${currencyNameTwo},
inverted: ${inverted}
    ''';
  }
}
