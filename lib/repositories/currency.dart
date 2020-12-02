import 'dart:convert';
import 'dart:io';

import 'package:conversor_moedas/app/toast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:conversor_moedas/enviroment/env.dart';

class Currency {
  Future<Map<String, dynamic>> getListCurrency(String codeCurrency, bool isUpdate) async {
    String apiUrl = Env.api;

    if (!isUpdate) {
      Map rates = await getListCurrencyCache(codeCurrency);

      if (rates != null) {
        return rates;
      }
    }

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
    String apiUrl = Env.api;

    try {
      Response response = await get('$apiUrl');

      Map data = json.decode(response.body);

      await setDateStoreCache(data['date']);

      for (var entry in data['rates'].entries) {
        Map<String, dynamic> ratesByCurrency = await getListCurrency(entry.key, true);
        await setCurrenciesListStoreCache(entry.key, ratesByCurrency);
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

  Future<String> lastDateAvaliable() async {
    String apiUrl = Env.api;

    try {
      Response response = await get('$apiUrl');

      Map data = json.decode(response.body);

      return data['date'].toString();
    } on SocketException {
      return '';
    } catch (e) {
      return '';
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

  Future deleteCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<Map<String, dynamic>> getListCurrencyCache(String currency) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String cachedData = prefs.getString(currency);

      if (cachedData == null) {
        return null;
      }

      Map cache = json.decode(cachedData);

      return cache['rates'];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
