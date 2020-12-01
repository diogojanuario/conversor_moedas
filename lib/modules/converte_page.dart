import 'package:conversor_moedas/app/utils.dart';
import 'package:conversor_moedas/modules/components/cardInfoCurrency.dart';
import 'package:conversor_moedas/modules/components/equalsIcon.dart';
import 'package:conversor_moedas/modules/components/inputCurrency.dart';
import 'package:conversor_moedas/modules/components/update.dart';
import 'package:flutter/material.dart';

class ConvertePage extends StatefulWidget {
  ConvertePage({Key key}) : super(key: key);

  @override
  _ConvertePageState createState() => _ConvertePageState();
}

class _ConvertePageState extends State<ConvertePage> {
  DateTime updateTime = DateTime.now();
  String updateTimeFormated = '';

  @override
  void initState() {
    super.initState();
    _prepareModule();
  }

  Future<void> _prepareModule() async {
    String tempUpdateTime = DateTime.now().toString();
    updateTime = (DateTime.parse(tempUpdateTime));
    updateTimeFormated = dateBrFormated(updateTime.toString());
  }

  Future<void> _getCurrenciesApi() async {
    print('Buscar dados api');
  }

  Future<void> _openListCurrency(cardCurrency, value) async {
    print(cardCurrency);
    print(value);
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
          child: Column(
            children: [
              Update(
                infoDate: updateTimeFormated,
                press: () {
                  _getCurrenciesApi();
                },
              ),
              SizedBox(height: size.height * 0.04),
              CardInfoCurrency(
                currency: 'USD',
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
                currency: 'BRL',
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
          ),
        ),
      ),
    );
  }
}
