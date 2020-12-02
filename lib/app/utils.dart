bool isNull(String str) {
  return str == null || str.isEmpty;
}

bool isNullNumber(num number) {
  return number == null;
}

bool isNullOrEmptyList(List list) {
  return list == null || list.isEmpty;
}

bool isNullOrEmptyMap(Map map) {
  return map == null || map.isEmpty;
}

String dateBrFormated(dateEua) {
  String dateReplace = dateEua.replaceAll(new RegExp(r'[^\w\s]+'), '');
  String _dateFormated =
      dateReplace.substring(6, 8) + '/' + dateReplace.substring(4, 6) + '/' + dateReplace.substring(0, 4);
  return _dateFormated;
}
