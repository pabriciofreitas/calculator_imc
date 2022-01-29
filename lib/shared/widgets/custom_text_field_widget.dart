import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isNumb;
  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.size,
    this.isNumb = false,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.075,
      width: size.width * 0.80,
      child: TextField(
        controller: controller,
        keyboardType: isNumb ? TextInputType.number : null,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
