import 'package:flutter/material.dart';

class EqualsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.40,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFB7B7B7).withOpacity(.11),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 50,
            color: Color(0xFFCFCFCF).withOpacity(.11),
          ),
        ],
      ),
      child: Text(
        '=',
        style: TextStyle(color: Color(0xFFFFD073), fontSize: 40),
        textAlign: TextAlign.center,
      ),
    );
  }
}
