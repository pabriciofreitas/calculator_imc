import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../components/components.dart';
import 'calculator_imc_presenter.dart';

class CalculatorImcPage extends StatefulWidget {
  final CalculatorImcPresentear presenter;

  const CalculatorImcPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<CalculatorImcPage> createState() => _CalculatorImcPageState();
}

class _CalculatorImcPageState extends State<CalculatorImcPage> {
  late final TextEditingController weigthController;
  late final TextEditingController heightController;
  @override
  void initState() {
    weigthController = TextEditingController();
    heightController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              CustomTextFieldWidget(
                isNumb: true,
                controller: weigthController,
                size: size,
                labelText: "Peso(kg)",
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .047,
                ),
                child: CustomTextFieldWidget(
                  isNumb: true,
                  controller: heightController,
                  size: size,
                  labelText: "Altura(cm)",
                ),
              ),
              CustomButton(
                  text: "Calcular",
                  onPressed: () {
                    widget.presenter.calcular(
                      heightController.text,
                      weigthController.text,
                    );
                  }),
              Padding(
                padding: EdgeInsets.only(top: size.height * .040),
                child: ValueListenableBuilder<String>(
                    valueListenable: widget.presenter.labelStatusNotifier,
                    builder: (_, value, __) {
                      return Text(
                        value,
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

  // @override
  // dispose() {
  //   widget.presenter.dispose();
  //   super.dispose();
  // }
}

// AppBar(
//         leading: Image.asset(AppImages.logoHome),
//         title: Text(
//           "Calculadora IMC",
//           style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                 color: Theme.of(context).colorScheme.onPrimary,
//               ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   widget.presenter.reset();
//                   heightController.clear();
//                   weigthController.clear();
//                 });
//               },
//               icon: const Icon(
//                 Icons.autorenew,
//               ))
//         ],
//       ),