import 'package:flutter/material.dart';

import '../../../infra/local/repository_local_adapter.dart';
import '../../../presentation/presentations/presentations.dart';
import '../../../presentation/presentations/to_do_list/value_notifier_to_do_list_presenter.dart';
import '../../../shared/shared.dart';
import '../../components/components.dart';
import '../calculadora_imc/calculadora_imc.dart';
import '../to_do_list/to_do_list_page.dart';
import '../to_do_list/to_do_list_presenter.dart';
import 'home_presenter.dart';

class HomePage extends StatefulWidget {
  final HomePresenter homePresenter;
  final PageController pageController = PageController();
  final ToDoListPresenter presenterToDoList =
      ValueNotifierToDoListPresenter(repository: RespositoryLocalAdapter());
  HomePage({
    Key? key,
    required this.homePresenter,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _drawerOptionList = [
    ["Calculadora IMC", Icons.accessibility_new],
    ["Lista de Tarefas", Icons.playlist_add_check],
    //["Lista de Tarefas", Icons.playlist_add_check]
  ];
  @override
  void initState() {
    super.initState();

    widget.homePresenter.pageIndexNotifier.addListener(() {
      widget.pageController.animateToPage(
        widget.homePresenter.pageIndexNotifier.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        pageViewNames: const <String>["Calculadora IMC", "Lista de Tarefas"],
        size: size,
        indexPage: widget.homePresenter.pageIndexNotifier,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.05,
                  left: size.width * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.user),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Usuario",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: _drawerOptionList.length,
                  separatorBuilder: (_, index) =>
                      SizedBox(height: size.height * .02),
                  itemBuilder: (context, index) {
                    List option = _drawerOptionList[index];
                    return ValueListenableBuilder(
                      valueListenable: widget.homePresenter.pageIndexNotifier,
                      builder: (context, value, _) {
                        return ListTile(
                          onTap: () {
                            widget.homePresenter.pageIndexNotifier.value =
                                index;
                            Navigator.pop(context);
                            // widget.pageController.animateToPage(index,
                            //     duration: const Duration(milliseconds: 500),
                            //     curve: Curves.bounceIn);
                          },
                          title: Text(
                            option[0],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.surface),
                          ),
                          leading: Icon(
                            option[1],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        children: [
          CalculatorImcPage(
            presenter: ValueNotifierCalculatorImcPresentear(),
          ),
          ToDoListPage(presenter: widget.presenterToDoList),
          Container()
        ],
      ),
    );
  }
}
