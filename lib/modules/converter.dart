import 'package:get_it/get_it.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';
import 'package:conversor_moedas/repositories/currency.dart';

class Converter {
  StoreApp storeApp = GetIt.I<StoreApp>();

  Future<void> calculateConverter(String inputCurrency, double amount, bool invertedCurrency) async {
    String currencyCodeFrom = (inputCurrency == 'currencyOne') ? storeApp.currencyOne : storeApp.currencyTwo;
    String currencyCodeTo = (inputCurrency == 'currencyOne') ? storeApp.currencyTwo : storeApp.currencyOne;

    Map<String, dynamic> ratesByCurrency = await Currency().getListCurrency(currencyCodeFrom, false);

    double valueToCalculate = ratesByCurrency[currencyCodeTo].toDouble();
    double currentAmount = invertedCurrency ? (amount * valueToCalculate ?? 0) : amount;
    double convertedResult = invertedCurrency ? amount : (amount * valueToCalculate ?? 0);

    storeApp.setInverted(invertedCurrency);
    storeApp.setAmount(currentAmount);
    storeApp.setValueConverted(convertedResult.toDouble());
  }
}
