import '../../domain/entities/entities.dart';

abstract class CurrrencysRepository {
  Future<List<Currency>> getCurrrencys();
}
