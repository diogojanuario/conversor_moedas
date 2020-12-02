import 'package:conversor_moedas/modules/components/cardInfoCurrency.dart';
import 'package:conversor_moedas/modules/converter.dart';
import 'package:conversor_moedas/modules/components/equalsIcon.dart';
import 'package:conversor_moedas/modules/components/input_currency_one.dart';
import 'package:conversor_moedas/modules/components/input_currency_two.dart';
import 'package:conversor_moedas/modules/components/update.dart';
import 'package:conversor_moedas/modules/list_currency.dart';
import 'package:conversor_moedas/repositories/currency.dart';
import 'package:conversor_moedas/app/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';

class ConvertePage extends StatefulWidget {
  ConvertePage({Key key}) : super(key: key);

  @override
  _ConvertePageState createState() => _ConvertePageState();
}

class _ConvertePageState extends State<ConvertePage> {
  StoreApp storeApp = GetIt.I<StoreApp>();

  @override
  void initState() {
    super.initState();
    _setUpdateState();
  }

  Future<void> _setUpdateState() async {
    await storeApp.setUpdateDate();

    String lastDateAvaliable = await Currency().lastDateAvaliable();

    if (lastDateAvaliable.isEmpty) {
      // await storeApp.setLastDateAvaliable(storeApp.updateDate);
      return;
    } else {
      await storeApp.setLastDateAvaliable(dateBrFormated(lastDateAvaliable));
    }

    await storeApp.setUpdateListCurrency();

    if (storeApp.updateListCurrency && lastDateAvaliable.isNotEmpty) {
      await storeApp.setUpdateDate();

      String lastDateAvaliable = await Currency().lastDateAvaliable();
      await storeApp.setLastDateAvaliable(dateBrFormated(lastDateAvaliable));
      await storeApp.setUpdateListCurrency();
    }
  }

  Future<void> _updateCurrenciesApi() async {
    storeApp.loadingApp(true);
    await Currency().updateListCurrency();
    // await storeApp.setUpdateDate();
    await _setUpdateState();
    storeApp.loadingApp(false);
  }

  Future<void> _openListCurrency(cardCurrency, value) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ListCurrency(
          cardCurrency: cardCurrency,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Observer(builder: (_) {
            return storeApp.loading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Colors.blue,
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Update(
                        press: () {
                          _updateCurrenciesApi();
                        },
                      ),
                      SizedBox(height: size.height * 0.04),
                      CardInfoCurrency(
                        currency: storeApp.currencyOne,
                        currencyName: storeApp.currencyNameOne,
                        press: (value) {
                          _openListCurrency('currencyOne', value);
                        },
                      ),
                      InputCurrency(
                        inputCurrency: 'currencyOne',
                        press: (inputCurrency, amount, invertedCurrency) {
                          Converter().calculateConverter(inputCurrency, amount, invertedCurrency);
                        },
                      ),
                      EqualsIcon(),
                      CardInfoCurrency(
                        currency: storeApp.currencyTwo,
                        currencyName: storeApp.currencyNameTwo,
                        press: (value) {
                          _openListCurrency('currencyTwo', value);
                        },
                      ),
                      InputCurrencyTwo(
                        inputCurrency: 'currencyTwo',
                        press: (inputCurrency, amount, invertedCurrency) {
                          Converter().calculateConverter(inputCurrency, amount, invertedCurrency);
                        },
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
