import 'package:dio/dio.dart';

import '../../data/api/api.dart';
import '../../domain/entities/entities.dart';
import '../../shared/constants.dart';

class CurrencysRepositoryAdapterDio implements CurrrencysRepository {
  Dio dio = Dio();
  @override
  Future<List<Currency>> getCurrrencys() async {
    //<List<Currency>>
    try {
      final result = await dio.get(Constants.API);
      final _currencys = result.data['results']['currencies'];
      final dolar = _currencys['USD']['buy'];
      final euro = _currencys['EUR']['buy'];
      return [
        Currency(name: "Dollar", value: dolar),
        Currency(name: "Euro", value: euro)
      ];
    } catch (_) {
      return [
        Currency(name: "Dollar", value: 0),
        Currency(name: "Euro", value: 0)
      ];
    }
  }
}
