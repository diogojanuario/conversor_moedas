import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';

class Update extends StatefulWidget {
  final void Function() press;

  const Update({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  StoreApp storeApp = GetIt.I<StoreApp>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        color: Color(0xFF4A84FF),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Última atualização',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                Text(
                  storeApp.updateDate,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
            Spacer(),
            storeApp.updateListCurrency
                ? RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    onPressed: widget.press,
                    color: Colors.white,
                    child: const Text(
                      'Atualizar',
                      style: TextStyle(
                        color: Color(0xFF1F4BA7),
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : storeApp.updateDate.isEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        child: Icon(
                          Icons.wifi_off,
                          color: Colors.grey[300],
                          size: 40,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.grey[300],
                          size: 40,
                        ),
                      ),
          ],
        ),
      );
    });
  }
}
