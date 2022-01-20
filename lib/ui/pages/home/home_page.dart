import 'package:flutter/material.dart';

import '../../../controllers/controllers.dart';
import '../../../shared/shared.dart';
import '../../components/components.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppImages.logoHome),
        title: Text(
          "Calculadora IMC",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        actions: [
          IconButton(
              onPressed: homeController.reset,
              icon: const Icon(
                Icons.autorenew,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * .044,
                  bottom: size.height * .057,
                ),
                child: Image.asset(
                  AppImages.user,
                  width: size.width * 0.28,
                  height: size.width * 0.28,
                ),
              ),
              TextFieldHomeWidget(
                controller: homeController.weigthController,
                size: size,
                labelText: "Peso(kg)",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .047,
                ),
                child: TextFieldHomeWidget(
                  controller: homeController.heightController,
                  size: size,
                  labelText: "Altura(cm)",
                ),
              ),
              CustomButton(
                text: "Calcular",
                onPressed: homeController.calcular,
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .040),
                child: ValueListenableBuilder(
                    valueListenable: homeController.labelStatusValue,
                    builder: (_, value, __) {
                      return Text(
                        "$value",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    homeController.dispose();
  }
}
