import 'package:flutter/material.dart';

import 'presentation/presentations/home/value_notifier_home_presenter.dart';
import 'presentation/presentations/presentations.dart';
import 'ui/components/components.dart';
import 'ui/pages/calculadora_imc/calculadora_imc.dart';
import 'ui/pages/home/home.dart';
import 'ui/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ioasys Challenges",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) =>
            HomePage(homePresenter: ValueNotifierHomePresenter()),
        "/calculator_imc": (context) => CalculatorImcPage(
              presenter: ValueNotifierCalculatorImcPresentear(),
            ),
      },
    );
  }
}
