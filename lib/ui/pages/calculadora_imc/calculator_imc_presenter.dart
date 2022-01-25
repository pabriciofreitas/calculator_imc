import 'package:flutter/foundation.dart';

abstract class CalculatorImcPresentear {
  void reset();
  void calcular(String heigth, String weigth);
  void dispose();
  ValueNotifier<String> get labelStatusValue;
}
