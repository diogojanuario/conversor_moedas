import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';

class InputCurrencyTwo extends StatefulWidget {
  final String inputCurrency;
  final void Function(String, double, bool) press;

  const InputCurrencyTwo({
    Key key,
    @required this.inputCurrency,
    this.press,
  }) : super(key: key);

  @override
  _InputCurrencyTwoState createState() => _InputCurrencyTwoState();
}

class _InputCurrencyTwoState extends State<InputCurrencyTwo> {
  StoreApp storeApp = GetIt.I<StoreApp>();
  TextEditingController _twoCurrencyController = new TextEditingController();

  _pressSubmitCurrency(double amount) {
    widget.press(widget.inputCurrency, amount, true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 24,
            color: Color(0xFFB7B7B7).withOpacity(.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Observer(builder: (_) {
              _twoCurrencyController.text = storeApp.valueConverted.toString();
              _twoCurrencyController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: storeApp.valueConverted.toString().length,
              );
              return TextFormField(
                onFieldSubmitted: (value) {
                  double intValue = double.parse(value);
                  _pressSubmitCurrency(intValue);
                },
                style: TextStyle(
                  fontSize: 20,
                ),
                textInputAction: TextInputAction.done,
                maxLines: 1,
                controller: _twoCurrencyController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp("[^0-9.]")),
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration.collapsed(
                  hintText: "0.0",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
