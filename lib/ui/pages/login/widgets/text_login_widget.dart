import 'package:flutter/material.dart';

class TextLoginWidget extends StatelessWidget {
  const TextLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "Seja bem vindo!\n",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          children: [
            TextSpan(
              text: "Calculadora IMC",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            )
          ]),
      textDirection: TextDirection.ltr,
    );
  }
}
