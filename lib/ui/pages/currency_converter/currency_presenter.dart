abstract class CurrencyConverterPresenter {
  Future<Map> fromDollar(String value);
  Future<Map> fromEuro(String value);
  Future<Map> fromReal(String value);
}
