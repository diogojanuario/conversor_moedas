import 'package:flutter/material.dart';

class CardInfoCurrency extends StatelessWidget {
  final String currency;
  final void Function(String) press;

  const CardInfoCurrency({
    Key key,
    @required this.currency,
    this.press,
  }) : super(key: key);

  _pressCardCurrency() {
    press(currency);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pressCardCurrency,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 14.0),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(26.0)),
        elevation: 1,
        child: ListTile(
          title: Text(
            currency,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade,
            softWrap: false,
            maxLines: 1,
          ),
          subtitle: Text(
            'moeda',
            overflow: TextOverflow.fade,
            softWrap: false,
            maxLines: 1,
            style: TextStyle(fontSize: 10),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.blue,
          ),
          leading: Container(
            width: 48,
            height: 48,
            padding: EdgeInsets.symmetric(vertical: 4.0),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(
                'icons/currency/${currency.toLowerCase()}.png',
                package: 'currency_icons',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
