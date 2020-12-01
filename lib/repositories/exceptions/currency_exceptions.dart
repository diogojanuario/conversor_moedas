class CurrencyException implements Exception {
  static const Map<String, String> errors = {
    "Status code: 400": "Oh-ooh! Ocorreu um erro interno.",
    "Status code: 500": "Oh-ooh! Ocorreu um erro interno.",
  };

  final String key;

  const CurrencyException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return this.key.toString();
    }
  }
}
