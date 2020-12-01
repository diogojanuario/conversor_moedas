bool isNull(String str) {
  return str == null || str.isEmpty;
}

bool isNullNumber(num number) {
  return number == null;
}

String dateBrFormated(dateEua) {
  String dateVanila = dateEua.replaceAll(new RegExp(r'[^\w\s]+'), '');
  String _dateFormated =
      dateVanila.substring(6, 8) + '/' + dateVanila.substring(4, 6) + '/' + dateVanila.substring(0, 4);
  return _dateFormated;
}

String dateEuaFormated(dateBr) {
  String dateVanila = dateBr.replaceAll(new RegExp(r'[^\w\s]+'), '');
  String _dateFormated = dateVanila.substring(4) + dateVanila.substring(2, 4) + dateVanila.substring(0, 2);
  return _dateFormated;
}
