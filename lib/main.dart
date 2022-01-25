import 'package:flutter/material.dart';
import 'package:imc/ui/components/components.dart';
import 'package:imc/ui/pages/calculadora_imc/calculadora_imc.dart';
import 'package:imc/ui/pages/home/home.dart';
import 'package:imc/ui/pages/login/login_page.dart';

import 'presentation/presentations/presentations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeData,
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/calculator_imc": (context) => CalculatorImcPage(
              presenter: ValueNotifierCalculatorImcPresentear(),
            ),
      },
    );
  }
}
