import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  final String infoDate;
  final void Function() press;

  const Update({
    Key key,
    @required this.infoDate,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  infoDate,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
            Spacer(),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              onPressed: press,
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
            ),
          ],
        ));
  }
}
