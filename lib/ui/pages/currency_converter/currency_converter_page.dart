import 'package:flutter/material.dart';

import '../../../presentation/presentations/currency_converter/currency_converter.dart';
import 'widget/widget.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController controllerBRL = TextEditingController();
  final presenter = ValueNotifierCurrencyConverter();
  final TextEditingController controllerDollar = TextEditingController();

  final TextEditingController controllerEuro = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Icon(
              Icons.attach_money,
              size: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03),
            CurrencyTextfield(
              onChange: (value) async {
                Map map = await presenter.fromReal(value);
                controllerDollar.text = map["Dollar"];
                controllerEuro.text = map["Euro"];
              },
              controller: controllerBRL,
              label: "Reais",
              prefix: "R\$  ",
              size: size,
            ),
            SizedBox(height: size.height * 0.03),
            CurrencyTextfield(
              onChange: (value) async {
                Map map = await presenter.fromDollar(value);
                controllerBRL.text = map["BRL"];
                controllerEuro.text = map["Euro"];
              },
              controller: controllerDollar,
              label: "Dólares",
              prefix: "US\$  ",
              size: size,
            ),
            SizedBox(height: size.height * 0.03),
            CurrencyTextfield(
              onChange: (value) async {
                Map map = await presenter.fromEuro(value);
                controllerDollar.text = map["Dollar"];
                controllerBRL.text = map["BRL"];
              },
              controller: controllerEuro,
              label: "Euros",
              prefix: "€ ",
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}

  // void initState() {
  //   super.initState();
  //   controllerBRL.addListener(() async {
  //     Map map = await presenter.fromReal(controllerBRL.text);
  //     controllerDollar.text = map["Dollar"];
  //     controllerEuro.text = map["Euro"];
  //   });
  //   controllerDollar.addListener(() async {
  //     Map map = await presenter.fromReal(controllerDollar.text);
  //     controllerBRL.text = map["BRL"];
  //     controllerEuro.text = map["Euro"];
  //   });
  //   controllerEuro.addListener(() async {
  //     Map map = await presenter.fromReal(controllerEuro.text);
  //     controllerDollar.text = map["Dollar"];
  //     controllerBRL.text = map["BRL"];
  //   });
  // }