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
  bool updateListCurrency = false;

  @observable
  String updateDate = '';

  @action
  Future<void> setUpdateDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateCached = prefs.getString('dateUpdated');

    updateDate = dateBrFormated(dateCached.toString());
  }

  @observable
  Future<void> setUpdateListCurrency() async {
    String timeNow = DateTime.now().toString().substring(0, 10);

    timeNow = dateBrFormated(timeNow.toString());

    if (timeNow != updateDate) {
      updateListCurrency = true;
    } else {
      updateListCurrency = false;
    }
  }
}
