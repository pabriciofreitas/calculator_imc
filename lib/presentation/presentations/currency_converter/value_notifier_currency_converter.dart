import '../../../data/api/api.dart';
import '../../../domain/entities/entities.dart';
import '../../../infra/api/api.dart';
import '../../../ui/pages/currency_converter/currency_converter.dart';

class ValueNotifierCurrencyConverter implements CurrencyConverterPresenter {
  final CurrrencysRepository repository = CurrencysRepositoryAdapterDio();
  @override
  Future<Map> fromReal(String value) async {
    try {
      List<Currency> _repository = await getCurrencys();
      double _value = double.parse(value);
      Currency dolar =
          _repository.firstWhere((element) => element.name == "Dollar");
      Currency euro =
          _repository.firstWhere((element) => element.name == "Euro");
      return {
        "Dollar": (_value / dolar.value).toStringAsFixed(2),
        "Euro": (_value / euro.value).toStringAsFixed(2),
      };
    } catch (_) {
      return {
        "Dollar": "",
        "Euro": "",
      };
    }
  }

  @override
  Future<Map> fromDollar(String value) async {
    try {
      List<Currency> _repository = await getCurrencys();
      double _value = double.parse(value);
      Currency dolar =
          _repository.firstWhere((element) => element.name == "Dollar");

      Currency euro =
          _repository.firstWhere((element) => element.name == "Euro");

      return {
        "Euro": ((_value * dolar.value) / euro.value).toStringAsFixed(2),
        "BRL": (_value * dolar.value).toStringAsFixed(2),
      };
    } catch (_) {
      return {"BRL": "", "Euro": ""};
    }
  }

  @override
  Future<Map> fromEuro(String value) async {
    try {
      List<Currency> _repository = await getCurrencys();
      double _value = double.parse(value);
      Currency dolar =
          _repository.firstWhere((element) => element.name == "Dollar");

      Currency euro =
          _repository.firstWhere((element) => element.name == "Euro");

      return {
        "Dollar": ((_value * euro.value) / dolar.value).toStringAsFixed(2),
        "BRL": (_value * euro.value).toStringAsFixed(2),
      };
    } catch (_) {
      return {"BRL": "", "Dollar": ""};
    }
  }

  Future<List<Currency>> getCurrencys() {
    return repository.getCurrrencys();
  }
}
