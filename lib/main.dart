import 'package:conversor_moedas/modules/converte_page.dart';
import 'package:conversor_moedas/services/stores/store_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocators();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(Main()),
  );
}

void setUpLocators() {
  GetIt.I.registerSingleton(StoreApp());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Conversor de Moedas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Nunito",
          backgroundColor: Color(0xFFFEFEFE),
          primaryColor: Color.fromRGBO(0, 54, 108, 1),
        ),
        home: ConvertePage());
  }
}
