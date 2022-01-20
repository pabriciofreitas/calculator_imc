import 'package:flutter/material.dart';

class HomeController {
  final labelStatusValue = ValueNotifier<String>("Digite os valores");
  TextEditingController weigthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String get labelStatus => labelStatusValue.value;
  set labelStatus(String value) => labelStatusValue.value = value;
  void calcular() {
    double weight = double.parse(weigthController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);
    labelStatus = "${getInterpretation(imc)} (${imc.toStringAsFixed(2)})";
  }

  String getInterpretation(double imc) {
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
    labelStatus = "Digite os valores";

    weigthController.clear();
    heightController.clear();
  }

  void dispose() {
    labelStatusValue.dispose();
  }
}
