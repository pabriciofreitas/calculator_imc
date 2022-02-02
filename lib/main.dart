import 'package:flutter/material.dart';

import 'presentation/presentations/home/value_notifier_home_presenter.dart';
import 'presentation/presentations/presentations.dart';
import 'ui/components/components.dart';
import 'ui/pages/pages.dart';

//API = Application Programming interface(Interface de programação de aplicações)
//response é respota que recebemos do servidor ;;Request é a que enviamos para servidor
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
        "currency_converter": (context) => const CurrencyConverterPage(),
      },
    );
  }
}

// class name extends StatelessWidget {
//   const name({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ElevatedButton(
//         onPressed: () => CurrencysRepositoryAdapterDio().getCurrrencys(),
//         child: const Text("asa"),
//       ),
//     );
//   }
// }
 /*
class Service {
  Dio dio = Dio();
  Future<void> getData() async {
    print("Entrou");
    final result = await dio.get("https://pokeapi.co/api/v2/pokemon/");
    print(result.data);
  }
} */
