import 'package:conversor_moedas/app/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'store_app.g.dart';

class StoreApp = _StoreAppBase with _$StoreApp;

abstract class _StoreAppBase with Store {
  @observable
  bool loading = false;

  @action
  Future<void> loadingApp(bool value) async {
    loading = value;
  }

  @observable
  String lastDateAvaliable;

  @action
  Future<void> setLastDateAvaliable(value) async {
    lastDateAvaliable = value;
  }

  @observable
  bool updateListCurrency = false;

  @observable
  String updateDate = '';

  @action
  Future<void> setUpdateDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateCached = prefs.getString('dateUpdated');

    if (!isNull(dateCached)) {
      updateDate = dateBrFormated(dateCached.toString());
    }
  }

  @observable
  Future<void> setUpdateListCurrency() async {
    if (updateDate != lastDateAvaliable) {
      updateListCurrency = true;
    } else {
      updateListCurrency = false;
    }
  }

  @observable
  String currencyOne = 'USD';

  @action
  void setCurrencyOne(String value) => currencyOne = value;

  @observable
  String currencyNameOne = 'United States Dollar';

  @action
  void setCurrencyNameOne(String value) => currencyNameOne = value;

  @observable
  String currencyTwo = 'BRL';

  @action
  void setCurrencyTwo(String value) => currencyTwo = value;

  @observable
  String currencyNameTwo = 'Brazilian Real';

  @action
  void setCurrencyNameTwo(String value) => currencyNameTwo = value;

  @observable
  double amount = 0.0;

  @action
  void setAmount(double value) => amount = value;

  @observable
  double valueConverted = 0.0;

  @action
  void setValueConverted(double value) => valueConverted = value;

  @observable
  bool inverted = false;

  @action
  void setInverted(bool value) => inverted = value;
}
