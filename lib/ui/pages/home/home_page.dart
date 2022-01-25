import 'package:flutter/material.dart';
import 'package:imc/shared/shared.dart';
import 'package:imc/ui/pages/calculadora_imc/calculadora_imc.dart';
import 'package:imc/ui/pages/to_do_list/to_do_list_page.dart';

import '../../../presentation/presentations/presentations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        pageViewNames: const <String>["Calculadora IMC", "Lista de Tarefas"],
        size: size,
      ),
      drawer: Drawer(
        child: Column(
          children: [Container()],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          CalculatorImcPage(
            presenter: ValueNotifierCalculatorImcPresentear(),
          ),
          const ToDoListPage()
        ],
      ),
    );
  }
}
