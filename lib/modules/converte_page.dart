import 'package:conversor_moedas/modules/components/cardInfoCurrency.dart';
import 'package:conversor_moedas/modules/components/equalsIcon.dart';
import 'package:conversor_moedas/modules/components/inputCurrency.dart';
import 'package:conversor_moedas/modules/components/update.dart';
import 'package:conversor_moedas/modules/list_currency.dart';
import 'package:conversor_moedas/repositories/currency.dart';
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
    _prepareModule();
  }

  Future<void> _prepareModule() async {
    await storeApp.setUpdateDate();
    await storeApp.setUpdateListCurrency();

    if (storeApp.updateListCurrency) {
      _updateCurrenciesApi();
    }
  }

  Future<void> _updateCurrenciesApi() async {
    storeApp.loadingApp(true);
    await Currency().updateListCurrency();
    await storeApp.setUpdateDate();
    storeApp.loadingApp(false);
  }

  Future<void> _openListCurrency(cardCurrency, value) async {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => ListCurrency(
          cardCurrency: cardCurrency,
        ),
      ),
    );
  }

  Future<void> _converteCurrency(String inputCurrency, int amount, bool invertedCurrency) async {
    print(inputCurrency);
    print(amount);
    print(invertedCurrency);
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
                        infoDate: storeApp.updateDate,
                        updatedAvaliable: storeApp.updateListCurrency,
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
                          _converteCurrency(inputCurrency, amount, invertedCurrency);
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
                      InputCurrency(
                        inputCurrency: 'currencyTwo',
                        press: (inputCurrency, amount, invertedCurrency) {
                          _converteCurrency(inputCurrency, amount, invertedCurrency);
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
