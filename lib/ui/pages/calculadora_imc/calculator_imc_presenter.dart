import 'package:flutter/foundation.dart';

abstract class CalculatorImcPresentear {
  void calcular(String heigth, String weigth);
  ValueNotifier<String> get labelStatusNotifier;
}
