import 'dart:convert';
import 'dart:io';

import 'package:conversor_moedas/app/toast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Currency {
  Future<Map<String, dynamic>> getListCurrency(String codeCurrency) async {
    String apiUrl = "https://api.exchangeratesapi.io/latest";

    try {
      Response response = await get('$apiUrl/?base=$codeCurrency');

      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        return data['rates'];
      }

      return {};
    } on SocketException {
      ToastMessage(message: "Conexão com a internet necessária.").showMessage();
      return {};
    } catch (e) {
      ToastMessage(message: "Um erro ocorreu. Tente novamente mais tarde.").showMessage();
      return {};
    }
  }

  Future<Map<String, dynamic>> updateListCurrency() async {
    String apiUrl = "https://api.exchangeratesapi.io/latest";

    try {
      Response response = await get('$apiUrl');

      Map data = json.decode(response.body);

      await setDateStoreCache(data['date']);

      for (var entry in data['rates'].entries) {
        Map<String, dynamic> ratesByCurrency = await getListCurrency(entry.key);
        await setCurrenciesListStoreCache(entry.key, ratesByCurrency);
      }

      print('atualizado!');

      return {};
    } on SocketException {
      ToastMessage(message: "Conexão com a internet necessária.").showMessage();
      return {};
    } catch (e) {
      ToastMessage(message: "Um erro ocorreu. Tente novamente mais tarde.").showMessage();
      return {};
    }
  }

  Future setDateStoreCache(String date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateUpdated', date);
  }

  Future setCurrenciesListStoreCache(String currency, Map<String, dynamic> rates) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> cachedData = {'rates': rates};

    prefs.setString(currency, json.encode(cachedData));
  }
}
