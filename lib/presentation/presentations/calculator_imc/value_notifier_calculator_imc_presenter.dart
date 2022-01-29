// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import '../../../ui/pages/calculadora_imc/calculator_imc_presenter.dart';

class ValueNotifierCalculatorImcPresentear implements CalculatorImcPresentear {
  final labelStatusControler = ValueNotifier<String>("Digite os valores");
  @override
  ValueNotifier<String> get labelStatusNotifier => labelStatusControler;

  @override
  void calcular(String height, String weight) {
    double _weight = double.parse(weight);
    double _height = double.parse(height) / 100;
    double imc = _weight / (_height * _height);
    labelStatusNotifier.value =
        "${_getInterpretation(imc)} (${imc.toStringAsFixed(2)})";
  }

  //
  String _getInterpretation(double imc) {
    if (imc < 17) {
      return "Muito abaixo do peso";
    } else if (imc >= 17 && imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      return "Peso normal";
    } else if (imc >= 25 && imc < 30) {
      return "Acima do peso";
    } else if (imc >= 30 && imc < 35) {
      return "Obesidade Grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
  }

  void reset() {
    labelStatusNotifier.value = "Digite os valores";
  }
}
