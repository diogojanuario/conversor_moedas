import 'package:flutter/material.dart';

class ConvertePage extends StatefulWidget {
  ConvertePage({Key key}) : super(key: key);

  @override
  _ConvertePageState createState() => _ConvertePageState();
}

class _ConvertePageState extends State<ConvertePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Conversor de Moedas'),
      ),
    );
  }
}
