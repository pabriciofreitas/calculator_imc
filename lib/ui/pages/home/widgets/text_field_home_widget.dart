import 'package:flutter/material.dart';

class TextFieldHomeWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const TextFieldHomeWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.075,
      width: size.width * 0.80,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // hintText: "Peso(kg)",
          labelText: labelText,
        ),
      ),
    );
  }
}
