import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputCurrency extends StatefulWidget {
  final String inputCurrency;
  final void Function(String, int, bool) press;

  const InputCurrency({
    Key key,
    @required this.inputCurrency,
    this.press,
  }) : super(key: key);

  @override
  _InputCurrencyState createState() => _InputCurrencyState();
}

class _InputCurrencyState extends State<InputCurrency> {
  _pressSubmitCurrency(int amount) {
    widget.press(widget.inputCurrency, amount, false);
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
            child: TextFormField(
              onFieldSubmitted: (value) {
                num intValue = int.parse(value);
                _pressSubmitCurrency(intValue);
              },
              style: TextStyle(
                fontSize: 20,
              ),
              textInputAction: TextInputAction.done,
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp("[^0-9]")),
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration.collapsed(
                hintText: "0.0",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
