import 'package:conversor_moedas/app/name_currency.dart';
import 'package:conversor_moedas/modules/converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';
import 'package:get_it/get_it.dart';

class ListCurrency extends StatefulWidget {
  final String cardCurrency;
  ListCurrency({this.cardCurrency});
  @override
  _ListCurrencyState createState() => _ListCurrencyState();
}

class _ListCurrencyState extends State<ListCurrency> {
  StoreApp storeApp = GetIt.I<StoreApp>();

  TextEditingController _editingController = new TextEditingController();
  String filter = "";

  @override
  void initState() {
    super.initState();
    _editingController.addListener(() {
      setState(() {
        filter = _editingController.value.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFD073),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Color(0xFF444343)),
                cursorColor: Color(0xFF444343),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Procurar',
                    labelStyle: TextStyle(color: Color(0xFF444343)),
                    hintText: 'Moeda',
                    hintStyle: TextStyle(color: Color(0xFF444343)),
                    prefixIcon: Icon(Icons.search),
                    prefixStyle: TextStyle(color: Color(0xFF444343)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF444343), width: 2.0)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF444343), width: 2.0))),
                controller: _editingController,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: currencyName.length,
                itemBuilder: (BuildContext context, int index) {
                  return filter == null || filter == ""
                      ? _getListItem(currencyName[index]['name'], currencyName[index]['code'])
                      : currencyName[index]['name'].toLowerCase().contains(filter.toLowerCase()) ||
                              currencyName[index]['code'].toLowerCase().contains(filter.toLowerCase())
                          ? _getListItem(currencyName[index]['name'], currencyName[index]['code'])
                          : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getListItem(String newCurrencyName, String newCurrencyCode) {
    return InkWell(
      onTap: () {
        if (widget.cardCurrency == 'currencyOne') {
          storeApp.setCurrencyOne(newCurrencyCode);
          storeApp.setCurrencyNameOne(newCurrencyName);
          Converter().calculateConverter(widget.cardCurrency, storeApp.amount, false);
        } else {
          storeApp.setCurrencyTwo(newCurrencyCode);
          storeApp.setCurrencyNameTwo(newCurrencyName);
          Converter().calculateConverter(widget.cardCurrency, storeApp.valueConverted, true);
        }
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Text(
          '$newCurrencyName ($newCurrencyCode)',
          style: TextStyle(
            color: Color(0xFF444343),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
